﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.objects.Container

package com.company.assembleegameclient.game_.objects.common{
import com.company.assembleegameclient.game_.objects.*;
    import com.company.util.PointUtil;
    import sounds._5T_;
    import com.company.assembleegameclient.game_.map._X_l;
    import source._R_v._sc;
    import com.company.assembleegameclient.game_.game.GameSprite;
    import source._R_v.Panel;

    public class Container extends GameObject implements _G_4 {

        public var _G_B_:Boolean;
        public var ownerId_:int;

        public function Container(_arg1:XML){
            super(_arg1);
            _064 = true;
            this._G_B_ = _arg1.hasOwnProperty("Loot");
            this.ownerId_ = -1;
        }
        public function _75(_arg1:int):void{
            this.ownerId_ = _arg1;
            _064 = (((this.ownerId_ < 0)) || (this._X_w()));
        }
        public function _X_w():Boolean{
            return ((map_.player_.accountId_ == this.ownerId_));
        }
        override public function addTo(_arg1:_X_l, _arg2:Number, _arg3:Number):Boolean{
            if (!super.addTo(_arg1, _arg2, _arg3))
            {
                return (false);
            };
            if (map_.player_ == null)
            {
                return (true);
            };
            var _local4:Number = PointUtil._R_O_(map_.player_.x_, map_.player_.y_, _arg2, _arg3);
            if (((this._G_B_) && ((_local4 < 10))))
            {
                _5T_.play("loot_appears");
            };
            return (true);
        }
        public function _C_s(_arg1:GameSprite):Panel{
            return (new _sc(_arg1, this));
        }

    }
}//package com.company.assembleegameclient.game_.objects

