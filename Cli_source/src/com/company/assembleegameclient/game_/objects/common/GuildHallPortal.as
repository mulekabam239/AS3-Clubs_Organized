﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.objects.GuildHallPortal

package com.company.assembleegameclient.game_.objects.common{
import com.company.assembleegameclient.game_.objects.*;
    import source._R_v._yo;
    import com.company.assembleegameclient.game_.game.GameSprite;
    import source._R_v.Panel;

    public class GuildHallPortal extends GameObject implements _G_4 {

        public function GuildHallPortal(_arg1:XML){
            super(_arg1);
            _064 = true;
        }
        public function _C_s(_arg1:GameSprite):Panel{
            return (new _yo(_arg1, this));
        }

    }
}//package com.company.assembleegameclient.game_.objects

