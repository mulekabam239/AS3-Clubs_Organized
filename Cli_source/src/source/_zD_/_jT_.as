// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._jT_

package source._zD_{
    import source._C__._cM_;
    import menus._02a;
    import source._W_D_._0I_H_;
    import source._04w._07V_;
    import source._U_5._D_L_;
    import com.company.assembleegameclient.network.appengine.SavedCharacter;
    import com.company.assembleegameclient.network.util._lJ_;
    import com.company.assembleegameclient.network.util._J_H_;
    import flash.display.BitmapData;
    import com.company.assembleegameclient.game_.objects.common.ObjectLibrary;
    import com.company.assembleegameclient.network.util._0B_c;
    import com.company.assembleegameclient.network.util.TextureRedrawer;
    import source._011._wx;

    public class _jT_ extends _cM_ {

        [Inject]
        public var view:_02a;
        [Inject]
        public var _eJ_:_0I_H_;
        [Inject]
        public var _bK_:_07V_;

        override public function initialize():void{
            _D_L_.getInstance().addOnce(this._07R_);
        }
        private function _07R_(_arg1:_wx):void{
            var _local2:SavedCharacter;
            var _local3:int;
            var _local4:XML;
            var _local5:_lJ_;
            var _local6:_J_H_;
            var _local7:int;
            var _local8:int;
            var _local9:BitmapData;
            var _local10:BitmapData;
            _local2 = null;
            for each (_local2 in this._eJ_._T_1.savedChars_)
            {
                if (this._eJ_._sy == _local2.charId()) break;
            };
            if (_local2)
            {
                _local3 = int(_local2._iJ_.ObjectType);
                _local4 = ObjectLibrary._Q_F_[_local3];
                _local5 = _0B_c._J_v(String(_local4.AnimatedTexture.File), int(_local4.AnimatedTexture.Index));
                _local6 = _local5.imageFromDir(_lJ_.RIGHT, _lJ_._m1, 0);
                _local7 = (((_local2)!=null) ? _local2.tex1() : null);
                _local8 = (((_local2)!=null) ? _local2.tex2() : null);
                _local9 = TextureRedrawer.resize(_local6.image_, _local6.mask_, 100, false, _local7, _local8);
                _local6 = _local5.imageFromDir(_lJ_.RIGHT, _lJ_._m1, 0.5);
                _local7 = (((_local2)!=null) ? _local2.tex1() : null);
                _local8 = (((_local2)!=null) ? _local2.tex2() : null);
                _local10 = TextureRedrawer.resize(_local6.image_, _local6.mask_, 100, false, _local7, _local8);
            };
            this.view.display(_arg1.name_, 0, _local9, _local10);
        }

    }
}//package source._zD_

