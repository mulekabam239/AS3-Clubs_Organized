// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.ChangeGuildRank

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class ChangeGuildRank extends _R_q {

        public var name_:String;
        public var guildRank_:int;

        public function ChangeGuildRank(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.name_);
            _arg1.writeInt(this.guildRank_);
        }
        override public function toString():String{
            return (formatToString("CHANGEGUILDRANK", "name_", "guildRank_"));
        }

    }
}//package packets

