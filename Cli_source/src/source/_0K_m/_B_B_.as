﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0K_m._B_B_

package source._0K_m{
    import com.company.assembleegameclient.game_.objects.common.GameObject;
    import com.company.assembleegameclient.network.util._04d;

    public class _B_B_ extends _I_b {

        public var go_:GameObject;
        public var _dQ_:_D_J_;
        public var color_:int;
        public var rate:Number;
        public var type:String;

        public function _B_B_(_arg1:GameObject, _arg2:_D_J_){
            this.go_ = _arg1;
            this.color_ = _arg2.color;
            this.rate = _arg2.rate;
            this._dQ_ = _arg2;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            var _local5:Number;
            var _local6:Number;
            var _local7:Number;
            var _local8:Number;
            var _local9:Number;
            var _local10:_t7;
            if (this.go_.map_ == null)
            {
                return (false);
            };
            x_ = this.go_.x_;
            y_ = this.go_.y_;
            var _local3:int = 20;
            var _local4:int;
            while (_local4 < this.rate)
            {
                _local5 = ((Math.random() + 0.3) * 200);
                _local6 = Math.random();
                _local7 = _04d._F_e((this._dQ_.speed - (this._dQ_.speed * (_local6 * (1 - this._dQ_.speedVariance)))));
                _local8 = _04d._F_e((this._dQ_.speed - (this._dQ_.speed * (_local6 * (1 - this._dQ_.speedVariance)))));
                _local9 = ((this._dQ_.life * 1000) - ((this._dQ_.life * 1000) * (_local6 * this._dQ_.lifeVariance)));
                _local10 = new _t7(_local5, this.color_, _local9, this._dQ_.spread, 0.75, _local7, _local8);
                map_.addObj(_local10, x_, y_);
                _local4++;
            };
            return (true);
        }

    }
}//package source._0K_m

