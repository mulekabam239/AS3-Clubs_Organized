// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.RequestTrade

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class RequestTrade extends _R_q {

        public var name_:String;

        public function RequestTrade(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.name_);
        }
        override public function toString():String{
            return (formatToString("REQUESTTRADE", "name_"));
        }

    }
}//package packets

