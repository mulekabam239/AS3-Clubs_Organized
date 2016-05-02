// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.PlayerShoot

package packets{
import packets.others._R_q;

import com.company.assembleegameclient.network.net.messages.data._Q_0;
    import flash.utils.IDataOutput;

    public class PlayerShoot extends _R_q {

        public var time_:int;
        public var bulletId_:uint;
        public var containerType_:int;
        public var startingPos_:_Q_0;
        public var angle_:Number;

        public function PlayerShoot(_arg1:uint){
            this.startingPos_ = new _Q_0();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            _arg1.writeByte(this.bulletId_);
            _arg1.writeShort(this.containerType_);
            this.startingPos_.writeToOutput(_arg1);
            _arg1.writeFloat(this.angle_);
        }
        override public function toString():String{
            return (formatToString("PLAYERSHOOT", "time_", "bulletId_", "containerType_", "startingPos_", "angle_"));
        }

    }
}//package packets

