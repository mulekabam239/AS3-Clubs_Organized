// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._4X_._03L_

package source._4X_{
    import source._sp._aJ_;

    public class _03L_ extends _zU_ {

        private var _xA_:_aJ_;
        private var _5g:Array;

        public function _03L_(_arg1:_aJ_, ... _args){
            this._xA_ = _arg1;
            this._5g = _args;
        }
        override protected function startTask():void{
            this._xA_.dispatch.apply(null, this._5g);
            _C_t(true);
        }

    }
}//package source._4X_

