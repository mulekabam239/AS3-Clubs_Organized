﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._02t._pM_

package source._02t{
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import com.company.assembleegameclient.game_.map._X_l;
    import com.company.util.IntPoint;
    import com.company.assembleegameclient.game_.map.MapView;
    import flash.events.Event;
    import flash.utils.getTimer;
    import flash.utils.ByteArray;
    import source._K_D_._p0;
    import source._H_Z_.Background;

    public class _pM_ extends Sprite {

        private static const BORDER:int = 10;
        private static const _R_m:Rectangle = new Rectangle(-400, -300, 800, 600);
        private static const _X_z:Number = ((7 * Math.PI) / 4);//5.49778714378214
        private static const _06B_:Number = (1 / 1000);//0.001
        private static const _01N_:Class = _final;

        private static var _I_k:_X_l;
        private static var _sl:IntPoint;
        private static var _jJ_:Number;
        private static var _U_b:Number;
        private static var _0F_q:MapView;

        private var _7n:int;
        private var time:Number;

        public function _pM_(){
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private function onAddedToStage(_arg1:Event):void{
            addChildAt((_I_k = ((_I_k) || (this._P_i()))), 0);
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            this._7n = getTimer();
        }
        private function onRemovedFromStage(_arg1:Event):void{
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        private function onEnterFrame(_arg1:Event):void{
            this.time = getTimer();
            _jJ_ = (_jJ_ + ((this.time - this._7n) * _06B_));
            if (_jJ_ > (_sl.x_ + BORDER))
            {
                _jJ_ = (_jJ_ - _sl.x_);
            };
            _0F_q._K_(_jJ_, _U_b, 12, _X_z, _R_m, false);
            _I_k.draw(_0F_q, this.time);
            this._7n = this.time;
        }
        private function _P_i():_X_l{
            var _local1:ByteArray = new _01N_();
            var _local2:String = _local1.readUTFBytes(_local1.length);
            _sl = _p0._0M_t(_local2);
            _jJ_ = BORDER;
            _U_b = (BORDER + int(((_sl.y_ - (2 * BORDER)) * Math.random())));
            _0F_q = new MapView();
            var _local3:_X_l = new _X_l(null);
            _local3._ti((_sl.x_ + (2 * BORDER)), _sl.y_, "Background Map", Background._0H_W_, false, false);
            _local3.initialize();
            _p0._T_6(_local2, _local3, 0, 0);
            _p0._T_6(_local2, _local3, _sl.x_, 0);
            return (_local3);
        }

    }
}//package source._02t

