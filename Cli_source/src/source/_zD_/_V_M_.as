﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._V_M_

package source._zD_{
    import source._C__._cM_;
    import menus._05p;
    import source._W_D_._0I_H_;
    import source._U_5._sC_;
    import source._U_5._sT_;
    import source._U_5._M_d;
    import source._U_5._01W_;
    import source._E_7._for_;
    import menus.common.MainScreen;
    import flash.display.Sprite;

    public class _V_M_ extends _cM_ {

        [Inject]
        public var view:_05p;
        [Inject]
        public var _eJ_:_0I_H_;
        [Inject]
        public var _0C__:_sC_;
        [Inject]
        public var _H_F_:_sT_;
        [Inject]
        public var _0B_a:_M_d;
        [Inject]
        public var _0_b:_01W_;

        override public function initialize():void{
            this.view.tooltip.add(this._Y_Y_);
            this.view._03I_.add(this._C_R_);
        }
        override public function destroy():void{
            this.view.tooltip.remove(this._Y_Y_);
            this.view._03I_.remove(this._C_R_);
            this.view.destroy();
            this._H_F_.dispatch();
        }
        private function _Y_Y_(_arg1:_for_):void{
            this._0C__.dispatch(_arg1);
        }
        private function _C_R_(_arg1:Class):void{
            var _local2:Sprite = new (((_arg1) || (MainScreen)))();
            this._0B_a.dispatch();
            this._0_b.dispatch(_local2);
        }

    }
}//package source._zD_
