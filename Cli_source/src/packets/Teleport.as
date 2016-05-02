// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.Teleport

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class Teleport extends _R_q {

        public var objectId_:int;

        public function Teleport(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.objectId_);
        }
        override public function toString():String{
            return (formatToString("TELEPORT", "objectId_"));
        }

    }
}//package packets

