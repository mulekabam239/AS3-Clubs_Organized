﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._02b._0D_5

package source._02b{
    import source._4X_._zU_;
    import source._W_D_._0I_H_;
    import source._U_5._bo;
    import flash.utils.Timer;
    import com.company.assembleegameclient.network.appengine._2n;
    import source._zo._mS_;
    import com.company.assembleegameclient.network.appengine._0K_R_;
    import source._qN_.Account;
    import flash.events.TimerEvent;

    public class _0D_5 extends _zU_ {

        private static const _W_1:int = 1000;

        [Inject]
        public var _0I_s:_0I_H_;
        [Inject]
        public var _08e:_bo;
        private var _Z_w:Timer;
        private var _0D_b:_2n;

        override protected function startTask():void{
            this._0D_b = new _2n();
            this._0D_b.addEventListener(_mS_.TEXT_ERROR, this._ix);
            this._0D_b.addEventListener(_0K_R_.SAVED_CHARS_LIST, this._dM_);
            this._J__();
        }
        private function _J__():void{
            this._0D_b._H_Q_();
        }
        private function _ix(_arg1:_mS_):void{
            this._08e.dispatch('<p align="center">Load error, retrying</p>');
            if (_arg1.text_ == "Account credentials not valid")
            {
                this._wg();
            } else
            {
                this._5j();
            };
        }
        private function _wg():void{
            Account._get().clear();
            this._J__();
        }
        private function _5j():void{
            this._Z_w = new Timer(_W_1, 1);
            this._Z_w.addEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
            this._Z_w.start();
        }
        private function _F_z(_arg1:TimerEvent):void{
            this._J__();
        }
        private function _dM_(_arg1:_0K_R_):void{
            this._0I_s._T_1 = new _0K_R_(_arg1._Q_I_);
            this._0I_s._34 = false;
            _C_t(true);
            if (this._Z_w != null)
            {
                this._qv();
            };
        }
        private function _qv():void{
            this._Z_w.stop();
            this._Z_w.removeEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
            this._Z_w = null;
        }

    }
}//package source._02b

