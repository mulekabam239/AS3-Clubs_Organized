﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.tutorial.Requirement

package com.company.assembleegameclient.game_.tutorial{
    import com.company.assembleegameclient.game_.objects.common.ObjectLibrary;

    public class Requirement {

        public var type_:String;
        public var _01U_:int = -1;
        public var objectType_:int = -1;
        public var _O_w:String = "";
        public var radius_:Number = 1;

        public function Requirement(_arg1:XML){
            this.type_ = String(_arg1);
            var _local2:String = String(_arg1.@objectId);
            if (((!((_local2 == null))) && (!((_local2 == "")))))
            {
                this.objectType_ = ObjectLibrary._pb[_local2];
            };
            this._O_w = String(_arg1.@objectName);
            if (this._O_w == null)
            {
                this._O_w = "";
            };
            this._01U_ = int(_arg1.@slot);
            this.radius_ = Number(_arg1.@radius);
        }
    }
}//package com.company.assembleegameclient.game_.tutorial

