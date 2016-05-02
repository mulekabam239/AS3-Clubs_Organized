﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.cliPackets
{
    public class JoinGuildPacket : ClientPacket
    {
        public string GuildName;

        public override PacketID ID { get { return PacketID.JoinGuild; } }
        public override Packet CreateInstance() { return new JoinGuildPacket(); }

        protected override void Read(ClientProcessor psr, NReader rdr)
        {
            GuildName = rdr.ReadUTF();
        }

        protected override void Write(ClientProcessor psr, NWriter wtr)
        {
            wtr.WriteUTF(GuildName);
        } 
    }
}
