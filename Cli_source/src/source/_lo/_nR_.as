﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._lo._nR_

package source._lo{
    import flash.events.Event;
    import flash.display.DisplayObjectContainer;
    import source._s3._yp;

    public class _nR_ extends Event {

        public static const _0K_h:String = "containerAdd";
        public static const _mh:String = "containerRemove";
        public static const _M_U_:String = "handlerAdd";
        public static const _T_A_:String = "handlerRemove";

        private var _0J_w:DisplayObjectContainer;
        private var _handler:_yp;

        public function _nR_(_arg1:String, _arg2:DisplayObjectContainer=null, _arg3:_yp=null){
            super(_arg1);
            this._0J_w = _arg2;
            this._handler = _arg3;
        }
        public function get container():DisplayObjectContainer{
            return (this._0J_w);
        }
        public function get handler():_yp{
            return (this._handler);
        }
        override public function clone():Event{
            return (new _nR_(type, this._0J_w, this._handler));
        }

    }
}//package source._lo

