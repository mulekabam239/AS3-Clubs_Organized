﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._fy

package source._zD_{
    import source._C__._cM_;
    import menus.common.LegendsScreen;
    import source._W_D_._0I_H_;
    import source._W_D_._G_J_;
    import source._U_5._M_d;
    import source._U_5._01W_;
    import com.company.assembleegameclient.network.appengine._0B_u;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import source._zo._8C_;
    import source._zo._mS_;
    import menus.common.CurrentCharacterScreen;
    import menus.common.MainScreen;
    import menus.common.DeathScreen;

    public class _fy extends _cM_ {

        [Inject]
        public var view:LegendsScreen;
        [Inject]
        public var _eJ_:_0I_H_;
        [Inject]
        public var _0K_K_:_G_J_;
        [Inject]
        public var _0D_p:_M_d;
        [Inject]
        public var _T__:_01W_;
        private var timespan:String;
        private var _0K_y:_0B_u;

        override public function initialize():void{
            this.timespan = "week";
            this._0K_y = new _0B_u(Parameters._fK_(), "/fame", true, 2);
            this._0K_y.addEventListener(_8C_.GENERIC_DATA, this._S_s);
            this._0K_y.addEventListener(_mS_.TEXT_ERROR, this._k9);
            this.view.close.add(this._of);
            this.view._8m.add(this._B_L_);
            this.view._T_c.add(this._0A_I_);
            this._qI_();
            this.view.initialize();
        }
        override public function destroy():void{
            this.view.close.remove(this._of);
            this.view._8m.remove(this._B_L_);
            this.view._T_c.remove(this._0A_I_);
        }
        private function _of():void{
            if (this._0K_K_._sr)
            {
                this._0K_K_._sr = false;
                this._0D_p.dispatch();
                this._T__.dispatch(new CurrentCharacterScreen());
            } else
            {
                this._T__.dispatch(new MainScreen());
            };
        }
        private function _B_L_(_arg1:String):void{
            this.timespan = _arg1;
            this._qI_();
        }
        private function _qI_():void{
            var _local1:int = this._eJ_._T_1.accountId_;
            var _local2:int = ((((!((_local1 == -1))) && (this._0K_K_._sr))) ? this._0K_K_._J_u : -1);
            this._0K_y.sendRequest("list", {
                "timespan":this.timespan,
                "accountId":_local1,
                "charId":_local2
            });
        }
        public function _S_s(_arg1:_8C_):void{
            var _local2:XML = XML(_arg1.data_);
            this.view._0d(_local2);
        }
        private function _k9(_arg1:_mS_):void{
            this.view._cC_(_arg1.text_);
        }
        private function _0A_I_(_arg1:int, _arg2:int):void{
            this._0K_K_._sr = false;
            this._0K_K_._Z__ = _arg1;
            this._0K_K_._J_u = _arg2;
            this._T__.dispatch(new DeathScreen());
        }

    }
}//package source._zD_

