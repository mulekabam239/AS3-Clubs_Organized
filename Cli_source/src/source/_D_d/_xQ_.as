﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._D_d._xQ_

package source._D_d{
    import flash.events.Event;

    import com.company.util.IntPoint;

    class _xQ_ extends Event {

        public static const TILES_EVENT:String = "TILES_EVENT";

        public var tiles_:Vector.<IntPoint>;

        public function _xQ_(_arg1:Vector.<IntPoint>){
            super(TILES_EVENT);
            this.tiles_ = _arg1;
        }
    }
}//package source._D_d

