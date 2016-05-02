// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.UsePotal

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class UsePotal extends _R_q {

        public var objectId_:int;

        public function UsePotal(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.objectId_);
        }
        override public function toString():String{
            return (formatToString("USEPORTAL", "objectId_"));
        }

    }
}//package packets

