// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._9M_

package source._zD_{
    import source._C__._cM_;
    import com.company.assembleegameclient.game_.charrects.CurrentCharacterRect;
    import source._U_5._7e;
    import source._05Z_._08i;
    import source._U_5._V_l;
    import com.company.assembleegameclient.network.appengine.SavedCharacter;
    import source._02b._fn;
    import source._04w._07V_;

    public class _9M_ extends _cM_ {

        [Inject]
        public var view:CurrentCharacterRect;
        [Inject]
        public var _o_:_7e;
        [Inject]
        public var _D_u:_08i;
        [Inject]
        public var _0K_q:_V_l;

        override public function initialize():void{
            this.view.selected.add(this._0A_U_);
            this.view.deleteCharacter.add(this._pk);
        }
        override public function destroy():void{
            this.view.selected.remove(this._0A_U_);
            this.view.deleteCharacter.remove(this._pk);
        }
        private function _0A_U_(_arg1:SavedCharacter):void{
            this._7D_(_arg1);
            this._nz(_arg1);
        }
        private function _7D_(_arg1:SavedCharacter):void{
            var _local2:_fn = new _fn();
            _local2.category = "character";
            _local2._lC_ = "select";
            _local2._9g = _arg1._jp();
            _local2.value = _arg1.level();
            this._o_.dispatch(_local2);
        }
        private function _nz(_arg1:SavedCharacter):void{
            var _local2:_07V_ = new _07V_();
            _local2._0_E_ = false;
            _local2.charId = _arg1.charId();
            _local2._05d = true;
            this._D_u.dispatch(_local2);
        }
        private function _pk(_arg1:SavedCharacter):void{
            this._0K_q.dispatch(_arg1);
        }

    }
}//package source._zD_

