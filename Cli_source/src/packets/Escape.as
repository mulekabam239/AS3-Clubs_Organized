// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.Escape

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class Escape extends _R_q {

        public function Escape(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
        }
        override public function toString():String{
            return (formatToString("ESCAPE"));
        }

    }
}//package packets

