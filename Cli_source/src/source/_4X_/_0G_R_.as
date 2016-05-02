// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._4X_._0G_R_

package source._4X_{
    public class _0G_R_ extends _zU_ {

        private var callback:Function;
        private var _wR_:Array;

        public function _0G_R_(_arg1:Function, ... _args){
            this.callback = _arg1;
            this._wR_ = _args;
        }
        override protected function startTask():void{
            this.callback.apply(this._wR_);
            _C_t(true);
        }

    }
}//package source._4X_

