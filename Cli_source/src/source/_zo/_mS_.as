﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zo._mS_

package source._zo{
    import flash.events.Event;

    public class _mS_ extends Event {

        public static const TEXT_ERROR:String = "TEXT_ERROR";

        public var text_:String;

        public function _mS_(_arg1:Object){
            super(TEXT_ERROR);
            if (_arg1 != null)
            {
                this.text_ = _arg1.toString();
            } else
            {
                this.text_ = "null";
            };
        }
        override public function clone():Event{
            return (new _mS_(this.text_));
        }
        override public function toString():String{
            return (formatToString(TEXT_ERROR, "text_"));
        }

    }
}//package source._zo

