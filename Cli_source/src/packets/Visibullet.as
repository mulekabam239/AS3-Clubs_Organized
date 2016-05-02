package packets {
import packets.others._R_q;

import flash.utils.IDataOutput;

public class Visibullet extends _R_q {

    public function Visibullet(param1:uint) {

        super(param1);
    }
    public var damage_:int;
    public var enemyId_:int;
    public var bulletId_:uint;

    override public function writeToOutput(param1:IDataOutput):void {
        param1.writeInt(this.damage_);
        param1.writeInt(this.enemyId_);
        param1.writeByte(this.bulletId_);
    }

    override public function toString():String {
        return formatToString("VISIBULLET", "damage_", "enemyId_", "bulletId_", "armorPiercing_");
    }
}
}
