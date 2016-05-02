// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._T_Y_._4A_

package source._T_Y_{
    import source._0_p._fq;
    import source._0_p._L_y;
    import source._0_p._C_P_;

    public class _4A_ implements _fq {

        private const _Z_p:_08n = new _08n();

        private var _rA_:_L_y;

        public function _4A_(_arg1:_L_y){
            this._rA_ = _arg1;
        }
        public function log(_arg1:Object, _arg2:uint, _arg3:int, _arg4:String, _arg5:Array=null):void{
            trace(((((((((_arg3 + " ") + _C_P_._A_n[_arg2]) + " ") + this._rA_) + " ") + _arg1) + " - ") + this._Z_p._nx(_arg4, _arg5)));
        }

    }
}//package source._T_Y_

