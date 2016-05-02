﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.network.appengine.SavedCharacter

package com.company.assembleegameclient.network.appengine{
    import com.company.assembleegameclient.network.util._0B_c;
    import com.company.assembleegameclient.network.util._lJ_;
    import com.company.assembleegameclient.network.util._J_H_;
    import com.company.assembleegameclient.network.util.TextureRedrawer;
    import flash.display.BitmapData;
    import com.company.util._G_;
    import flash.geom.ColorTransform;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import com.company.assembleegameclient.game_.objects.common.ObjectLibrary;

    public class SavedCharacter {

        public var _iJ_:XML;
        public var name_:String = null;

        public function SavedCharacter(_arg1:XML, _arg2:String){
            this._iJ_ = _arg1;
            this.name_ = _arg2;
        }
        public static function getImage(_arg1:SavedCharacter, _arg2:XML, _arg3:int, _arg4:int, _arg5:Number, _arg6:Boolean, _arg7:Boolean):BitmapData{
            var _local8:_lJ_ = _0B_c._J_v(String(_arg2.AnimatedTexture.File), int(_arg2.AnimatedTexture.Index));
            var _local9:_J_H_ = _local8.imageFromDir(_arg3, _arg4, _arg5);
            var _local10:int = (((_arg1)!=null) ? _arg1.tex1() : null);
            var _local11:int = (((_arg1)!=null) ? _arg1.tex2() : null);
            var _local12:BitmapData = TextureRedrawer.resize(_local9.image_, _local9.mask_, 100, false, _local10, _local11);
            _local12 = TextureRedrawer.outlineGlow(_local12, 0, 0);
            if (!_arg6)
            {
                _local12 = _G_._B_2(_local12, new ColorTransform(0, 0, 0, 0.5, 0, 0, 0, 0));
            } else
            {
                if (!_arg7)
                {
                    _local12 = _G_._B_2(_local12, new ColorTransform(0.75, 0.75, 0.75, 1, 0, 0, 0, 0));
                };
            };
            return (_local12);
        }
        public static function _N_Q_(_arg1:SavedCharacter, _arg2:SavedCharacter):Number{
            var _local3:Number = ((Parameters.data_.charIdUseMap.hasOwnProperty(_arg1.charId())) ? Parameters.data_.charIdUseMap[_arg1.charId()] : 0);
            var _local4:Number = ((Parameters.data_.charIdUseMap.hasOwnProperty(_arg2.charId())) ? Parameters.data_.charIdUseMap[_arg2.charId()] : 0);
            if (_local3 != _local4)
            {
                return ((_local4 - _local3));
            };
            return ((_arg2._zG_() - _arg1._zG_()));
        }

        public function charId():int{
            return (int(this._iJ_.@id));
        }
        public function name():String{
            return (this.name_);
        }
        public function objectType():int{
            return (int(this._iJ_.ObjectType));
        }
        public function level():int{
            return (int(this._iJ_.Level));
        }
        public function tex1():int{
            return (int(this._iJ_.Tex1));
        }
        public function tex2():int{
            return (int(this._iJ_.Tex2));
        }
        public function _zG_():int{
            return (int(this._iJ_.Exp));
        }
        public function fame():int{
            return (int(this._iJ_.CurrentFame));
        }
        public function _jp():String{
            return (ObjectLibrary._0D_N_[this.objectType()]);
        }
        public function toString():String{
            return ((("SavedCharacter: {" + this._iJ_) + "}"));
        }

    }
}//package com.company.assembleegameclient.network.appengine

