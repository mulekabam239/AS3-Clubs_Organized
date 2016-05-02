using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Concurrent;
using System.Threading;
using log4net;

namespace wServer.realm
{
    public class NetworkTicker //Sync network processing
    {
        ILog log = LogManager.GetLogger(typeof(NetworkTicker));

        //public void AddPendingAction(ClientProcessor client, Action<RealmTime> callback)
        public void AddPendingPacket(ClientProcessor client, Packet packet)
        {
            pendings.Enqueue(new Tuple<ClientProcessor, Packet>(client, packet));//Action<RealmTime>>(client, callback));
            handle.Set();
        }
        AutoResetEvent handle = new AutoResetEvent(false);
        //static ConcurrentQueue<Tuple<ClientProcessor, Action<RealmTime>>> pendings = new ConcurrentQueue<Tuple<ClientProcessor, Action<RealmTime>>>();
        static ConcurrentQueue<Tuple<ClientProcessor, Packet>> pendings = new ConcurrentQueue<Tuple<ClientProcessor, Packet>>();


        public void TickLoop()
        {
            do
            {
     
                handle.WaitOne();

                Tuple<ClientProcessor, Packet> work;//Action<RealmTime>> work;
                while (pendings.TryDequeue(out work))
                {
                    if (work.Item1.Stage == ProtocalStage.Disconnected)
                    {
                        ClientProcessor psr;
                        continue;
                    }
                    try
                    {
                        work.Item1.ProcessPacket(work.Item2);
                        //work.Item2(LogicTicker.CurrentTime);
                    }
                    catch { }
                }

            } while (true);
        }
    }
}
