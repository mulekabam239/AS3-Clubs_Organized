﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._011._Y_F_

package source._011{
    import flash.utils.IDataInput;

    public class _Y_F_ extends _01Q_ {

        public var objectId_:int;

        public function _Y_F_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.objectId_ = _arg1.readInt();
        }
        override public function toString():String{
            return (formatToString("QUESTOBJID", "objectId_"));
        }

    }
}//package source._011

