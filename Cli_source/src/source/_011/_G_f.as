﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._011._G_f

package source._011{
    import flash.utils.IDataInput;

    public class _G_f extends _01Q_ {

        public static const _4R_:int = 0;
        public static const _D_4:int = 1;
        public static const _I_h:int = 2;
        public static const _vE_:int = 3;
        public static const _00Z_:int = 4;
        public static const _C_w:int = 5;
        public static const _oo:int = 6;

        public var errorId_:int;
        public var errorDescription_:String;

        public function _G_f(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.errorId_ = _arg1.readInt();
            this.errorDescription_ = _arg1.readUTF();
        }
        override public function toString():String{
            return (formatToString("FAILURE", "errorId_", "errorDescription_"));
        }

    }
}//package source._011

