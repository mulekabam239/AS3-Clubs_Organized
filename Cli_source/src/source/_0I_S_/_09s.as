﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0I_S_._09s

package source._0I_S_{
    import flash.events.Event;
    import com.company.assembleegameclient.network.appengine.SavedCharacter;

    public class _09s extends Event {

        public static const DELETE_CHARACTER_EVENT:String = "DELETE_CHARACTER_EVENT";

        public var savedChar_:SavedCharacter;

        public function _09s(_arg1:SavedCharacter){
            super(DELETE_CHARACTER_EVENT);
            this.savedChar_ = _arg1;
        }
    }
}//package source._0I_S_

