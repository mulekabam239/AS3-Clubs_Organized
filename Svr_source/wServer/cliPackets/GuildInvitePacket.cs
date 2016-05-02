﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.cliPackets
{
    public class GuildInvitePacket : ClientPacket
    {
        public string Name;

        public override PacketID ID { get { return PacketID.GuildInvite; } }
        public override Packet CreateInstance() { return new GuildInvitePacket(); }

        protected override void Read(ClientProcessor psr, NReader rdr)
        {
            Name = rdr.ReadUTF();
        }

        protected override void Write(ClientProcessor psr, NWriter wtr)
        {
            wtr.WriteUTF(Name);
        } 
    }
}
