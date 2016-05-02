// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.CancelTrade

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class CancelTrade extends _R_q {

        public var objectId_:int;

        public function CancelTrade(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
        }
        override public function toString():String{
            return (formatToString("CANCELTRADE"));
        }

    }
}//package packets

