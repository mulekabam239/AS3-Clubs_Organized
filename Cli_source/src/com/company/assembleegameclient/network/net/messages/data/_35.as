﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.network.net.messages.data._35

package com.company.assembleegameclient.network.net.messages.data{
    import flash.utils.IDataInput;

    public class _35 {

        public var item_:int;
        public var _01T_:int;
        public var _var:Boolean;
        public var included_:Boolean;

        public function parseFromInput(_arg1:IDataInput):void{
            this.item_ = _arg1.readInt();
            this._01T_ = _arg1.readInt();
            this._var = _arg1.readBoolean();
            this.included_ = _arg1.readBoolean();
        }
        public function toString():String{
            return (((((((("item: " + this.item_) + " slotType: ") + this._01T_) + " tradeable: ") + this._var) + " included:") + this.included_));
        }

    }
}//package com.company.assembleegameclient.network.net.messages.data

