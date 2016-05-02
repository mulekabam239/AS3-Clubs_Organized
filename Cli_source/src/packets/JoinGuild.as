// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.JoinGuild

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class JoinGuild extends _R_q {

        public var guildName_:String;

        public function JoinGuild(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.guildName_);
        }
        override public function toString():String{
            return (formatToString("JOINGUILD", "guildName_"));
        }

    }
}//package packets

