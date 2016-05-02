// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.PlayerHit

package packets{
import packets.others._R_q;

import flash.utils.IDataOutput;

    public class PlayerHit extends _R_q {

        public var bulletId_:uint;
        public var objectId_:int;

        public function PlayerHit(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeByte(this.bulletId_);
            _arg1.writeInt(this.objectId_);
        }
        override public function toString():String{
            return (formatToString("PLAYERHIT", "bulletId_", "objectId_"));
        }

    }
}//package packets

