﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets._0C_7

package packets.others{
import packets.*;
    import flash.utils.IDataOutput;

    public class _0C_7 extends _R_q {

        public var accountListId_:int;
        public var add_:Boolean;
        public var objectId_:int;

        public function _0C_7(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.accountListId_);
            _arg1.writeBoolean(this.add_);
            _arg1.writeInt(this.objectId_);
        }
        override public function toString():String{
            return (formatToString("EDITACCOUNTLIST", "accountListId_", "add_", "objectId_"));
        }

    }
}//package packets

