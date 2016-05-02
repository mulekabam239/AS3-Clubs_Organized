// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.PlayerText

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class PlayerText extends _R_q {

        public var text_:String;

        public function PlayerText(_arg1:uint){
            this.text_ = new String();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.text_);
        }
        override public function toString():String{
            return (formatToString("PLAYERTEXT", "text_"));
        }

    }
}//package packets

