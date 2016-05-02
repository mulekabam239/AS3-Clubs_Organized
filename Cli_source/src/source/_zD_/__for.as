// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_.__for

package source._zD_{
    import source._C__._cM_;
    import menus.common.MainScreen;
    import source._W_D_._0I_H_;
    import source._U_5._dd;
    import source._05Z_._08i;
    import source._ke._0M_1;
    import source._0L_C_._qO_;
    import source._04w._07V_;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import menus.common.CurrentCharacterScreen;
    import menus.common.CreditsScreen;
    import menus.common.ServerScreen2;
    import menus.common.LegendsScreen;
    import source._D_d._hj;
    import flash.events.Event;

    public class __for extends _cM_ {

        [Inject]
        public var view:MainScreen;
        [Inject]
        public var _eJ_:_0I_H_;
        [Inject]
        public var _T__:_dd;
        [Inject]
        public var _D_u:_08i;

        override public function initialize():void{
            this.view._ft.add(this._F_A_);
            this.view.initialize(this._eJ_._T_1);
        }
        override public function destroy():void{
            this.view._ft.remove(this._F_A_);
        }
        public function _F_A_(_arg1:String):void{
            switch (_arg1)
            {
                case _0M_1.PLAY:
                    this._04P_();
                    return;
                case _0M_1.SERVERS:
                    this._0B_M_();
                    return;
                case _0M_1.CREDITS:
                    this._C_0();
                    return;
                case _0M_1.ACCOUNT:
                    this._0A_3();
                    return;
                case _0M_1.LEGENDS:
                    this._N_E_();
                    return;
                case _0M_1.EDITOR:
                    this._0E_r();
                    return;
                case _0M_1.QUIT:
                    this._uz();
                    return;
            };
        }
        private function _04P_():void{
            var _local1:_qO_;
            var _local2:_07V_;
            if (((Parameters.isTesting) && ((this._eJ_._T_1.servers_.length == 0))))
            {
                if (Parameters._I_O_())
                {
                    _local1 = new _qO_(((("There are currently no testing servers available.  " + 'Please play on <font color="#7777EE">') + '<a href="http://www.realmofthemadgod.com/">') + "www.realmofthemadgod.com</a></font>."), "No Testing Servers", null, null, "/noTestingServers");
                } else
                {
                    _local1 = new _qO_((((("Realm of the Mad God is currently offline.\n\n" + "Go here for more information:\n") + '<font color="#7777EE">') + '<a href="http://forums.wildshadow.com/">') + "forums.wildshadow.com</a></font>."), "Oryx Sleeping", null, null, "/offLine");
                };
                this.view.stage.addChild(_local1);
                return;
            };
            if (((Parameters.data_.needsTutorial) && ((this._eJ_._T_1.nextCharId_ == 1))))
            {
                Parameters.data_.playerObjectType = 782;
                Parameters.save();
                _local2 = new _07V_();
                _local2._0_E_ = true;
                _local2.charId = this._eJ_._T_1.nextCharId_;
                _local2._f2 = -1;
                _local2._05d = true;
                this._D_u.dispatch(_local2);
            } else
            {
                this._T__.dispatch(new CurrentCharacterScreen());
            };
        }
        private function _C_0():void{
            this._T__.dispatch(new CreditsScreen());
        }
        private function _0B_M_():void{
            this._T__.dispatch(new ServerScreen2());
        }
        private function _0A_3():void{
            this.view._0j();
        }
        private function _N_E_():void{
            this._T__.dispatch(new LegendsScreen());
        }
        private function _0E_r():void{
            this._T__.dispatch(new _hj());
        }
        private function _uz():void{
            dispatch(new Event("APP_CLOSE_EVENT"));
        }

    }
}//package source._zD_

