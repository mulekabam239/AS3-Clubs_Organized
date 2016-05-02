// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.data.Cookie

package com.google.analytics.data{
    public interface Cookie {

        function fromSharedObject(_arg1:Object):void;
        function toURLString():String;
        function get creation():Date;
        function toSharedObject():Object;
        function isExpired():Boolean;
        function set creation(_arg1:Date):void;
        function set expiration(_arg1:Date):void;
        function get expiration():Date;

    }
}//package com.google.analytics.data

