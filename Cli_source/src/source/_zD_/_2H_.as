// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._2H_

package source._zD_{
    import source._C__._cM_;
    import menus._0H_2;
    import source._W_D_._0I_H_;
    import source._U_5._dd;
    import source._05Z_._08i;
    import menus.common.CurrentCharacterScreen;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import source._04w._07V_;

    public class _2H_ extends _cM_ {

        [Inject]
        public var view:_0H_2;
        [Inject]
        public var _eJ_:_0I_H_;
        [Inject]
        public var _T__:_dd;
        [Inject]
        public var _D_u:_08i;

        override public function initialize():void{
            this.view.play.add(this._fN_);
            this.view.close.add(this._of);
            this.view.initialize(this._eJ_._T_1);
        }
        override public function destroy():void{
            this.view.play.remove(this._fN_);
            this.view.close.remove(this._fN_);
        }
        private function _of():void{
            this._T__.dispatch(new CurrentCharacterScreen());
        }
        private function _fN_(_arg1:int):void{
            Parameters.data_.playerObjectType = _arg1;
            Parameters.save();
            var _local2:_07V_ = new _07V_();
            _local2._0_E_ = true;
            _local2.charId = this._eJ_._T_1.nextCharId_;
            _local2._f2 = -1;
            this._D_u.dispatch(_local2);
        }

    }
}//package source._zD_

