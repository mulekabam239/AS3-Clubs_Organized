﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._03T_.ObjectProcessor

package source._03T_{
    import source._qj._pn;

    public class ObjectProcessor {

        private const _handlers:Array = [];

        public function _K_j(_arg1:_pn, _arg2:Function):void{
            this._handlers.push(new ObjectHandler(_arg1, _arg2));
        }
        public function _049(_arg1:Object):void{
            var _local2:ObjectHandler;
            for each (_local2 in this._handlers)
            {
                _local2.handle(_arg1);
            };
        }

    }
}//package source._03T_

import source._qj._pn;

class ObjectHandler {

    /*private*/ var _matcher:_pn;
    /*private*/ var _handler:Function;

    public function ObjectHandler(_arg1:_pn, _arg2:Function){
        this._matcher = _arg1;
        this._handler = _arg2;
    }
    public function handle(_arg1:Object):void{
        ((this._matcher.matches(_arg1)) && (this._handler(_arg1)));
    }

}

