// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.SetCondition

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class SetCondition extends _R_q {

        public var conditionEffect_:uint;
        public var conditionDuration_:Number;

        public function SetCondition(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeByte(this.conditionEffect_);
            _arg1.writeFloat(this.conditionDuration_);
        }
        override public function toString():String{
            return (formatToString("SETCONDITION", "conditionEffect_", "conditionDuration_"));
        }

    }
}//package packets

