﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0J_k._0J_f

package source._0J_k{
    import flash.utils.Dictionary;
    import source._4u.SsInternal;
    import source._Y_3._5d;
    import source._M_Q_._B_h;
    import flash.utils.getQualifiedClassName;
    import source._eZ_._08b;

    public class _0J_f extends _5W_ {

        private var _T_e:String;
        private var _08c:String;
        private var _K_W_:Boolean;

        public function _0J_f(_arg1:String, _arg2:String, _arg3:Boolean, _arg4:Dictionary){
            this._T_e = _arg2;
            this._08c = _arg1;
            this._K_W_ = _arg3;
            this.injectParameters = _arg4;
        }
        override public function applyInjection(_arg1:Object, _arg2:Class, _arg3:_08b):void{
            var _local4:_5d = _arg3.SsInternal::_L_E_(this._08c);
            if (!_local4)
            {
                if (this._K_W_)
                {
                    return;
                };
                throw (new _B_h((((((((('Injector is missing a mapping to handle injection into property "' + this._T_e) + '" of object "') + _arg1) + '" with type "') + getQualifiedClassName(_arg2)) + '". Target dependency: "') + this._08c) + '"')));
            };
            _arg1[this._T_e] = _local4.apply(_arg2, _arg3, injectParameters);
        }

    }
}//package source._0J_k

