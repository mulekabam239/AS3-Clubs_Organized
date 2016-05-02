// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._K_8._L_G_

package source._K_8{
    import source._C__._cM_;
    import source._0_j._kW_;
    import source._W_D_._0I_H_;
    import source._U_5._0_D_;

    public class _L_G_ extends _cM_ {

        [Inject]
        public var view:_kW_;
        [Inject]
        public var _0I_s:_0I_H_;
        [Inject]
        public var _o_:_0_D_;

        override public function initialize():void{
            this.view.initialize(this._0I_s._T_1);
            this._o_.dispatch("/textureScreen");
        }
        override public function destroy():void{
            super.destroy();
        }

    }
}//package source._K_8

