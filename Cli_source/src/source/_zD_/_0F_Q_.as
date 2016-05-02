// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._0F_Q_

package source._zD_{
    import source._C__._cM_;
    import menus.common.CreditsScreen;
    import source._U_5._dd;
    import menus.common.MainScreen;

    public class _0F_Q_ extends _cM_ {

        [Inject]
        public var view:CreditsScreen;
        [Inject]
        public var _T__:_dd;

        override public function initialize():void{
            this.view.close.add(this._0H_N_);
            this.view.initialize();
        }
        override public function destroy():void{
            this.view.close.remove(this._0H_N_);
        }
        private function _0H_N_():void{
            this._T__.dispatch(new MainScreen());
        }

    }
}//package source._zD_

