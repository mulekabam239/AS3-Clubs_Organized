// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.GroundDamage

package packets{
import packets.others._R_q;

import com.company.assembleegameclient.network.net.messages.data._Q_0;
    import flash.utils.IDataOutput;

    public class GroundDamage extends _R_q {

        public var time_:int;
        public var position_:_Q_0;

        public function GroundDamage(_arg1:uint){
            this.position_ = new _Q_0();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            this.position_.writeToOutput(_arg1);
        }
        override public function toString():String{
            return (formatToString("GROUNDDAMAGE", "time_", "position_"));
        }

    }
}//package packets

