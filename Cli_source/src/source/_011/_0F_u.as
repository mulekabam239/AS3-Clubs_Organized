﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._011._0F_u

package source._011{
    import flash.utils.IDataInput;

    public class _0F_u extends _01Q_ {

        public var name_:String;
        public var value_:int;

        public function _0F_u(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.name_ = _arg1.readUTF();
            this.value_ = _arg1.readInt();
        }
        override public function toString():String{
            return (formatToString("CLIENTSTAT", "name_", "value_"));
        }

    }
}//package source._011

