﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets._0I_8

package packets.others{
import packets.*;
    import flash.utils.IDataOutput;

    public class _0I_8 extends _R_q {

        public var time_:int;

        public function _0I_8(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
        }
        override public function toString():String{
            return (formatToString("SHOOTACK", "time_"));
        }

    }
}//package packets

