﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._011._04R_

package source._011{
    import com.company.assembleegameclient.network.net.messages.data._Q_0;
    import flash.utils.IDataInput;

    public class _04R_ extends _01Q_ {

        public var objectId_:int;
        public var pos_:_Q_0;

        public function _04R_(_arg1:uint){
            this.pos_ = new _Q_0();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.objectId_ = _arg1.readInt();
            this.pos_.parseFromInput(_arg1);
        }
        override public function toString():String{
            return (formatToString("GOTO", "objectId_", "pos_"));
        }

    }
}//package source._011

