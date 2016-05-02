// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.Load

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class Load extends _R_q {

        public var charId_:int;

        public function Load(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.charId_);
        }
        override public function toString():String{
            return (formatToString("LOAD", "charId_"));
        }

    }
}//package packets

