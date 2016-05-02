// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._uf

package source._zD_{
    import source._C__._cM_;
    import menus.common.LoadingScreen2;
    import source._U_5._01W_;
    import menus.common.MainScreen;

    public class _uf extends _cM_ {

        [Inject]
        public var view:LoadingScreen2;
        [Inject]
        public var _T__:_01W_;

        override public function initialize():void{
            this.view._J_b.add(this._E_R_);
        }
        override public function destroy():void{
            this.view._J_b.remove(this._E_R_);
        }
        private function _E_R_():void{
            this._T__.dispatch(new MainScreen());
        }

    }
}//package source._zD_

