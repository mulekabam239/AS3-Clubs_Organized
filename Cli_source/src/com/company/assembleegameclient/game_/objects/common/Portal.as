﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.objects.Portal

package com.company.assembleegameclient.game_.objects.common{
import com.company.assembleegameclient.game_.objects.*;

    import flash.display.IGraphicsData;
    import com.company.assembleegameclient.game_.map.MapView;
    import source._R_v._Y_8;
    import com.company.assembleegameclient.game_.game.GameSprite;
    import source._R_v.Panel;

    public class Portal extends GameObject implements _G_4 {

        public var _0J_A_:Boolean;
        public var _xq:Boolean;
        public var _09S_:Boolean = true;

        public function Portal(_arg1:XML){
            super(_arg1);
            _064 = true;
            this._0J_A_ = _arg1.hasOwnProperty("NexusPortal");
            this._xq = _arg1.hasOwnProperty("LockedPortal");
        }
        override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:MapView, _arg3:int):void{
            super.draw(_arg1, _arg2, _arg3);
            if (this._0J_A_)
            {
                _oL_(_arg1, _arg2);
            };
        }
        public function _C_s(_arg1:GameSprite):Panel{
            return (new _Y_8(_arg1, this));
        }

    }
}//package com.company.assembleegameclient.game_.objects

