﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.objects.GuildChronicle

package com.company.assembleegameclient.game_.objects.common{
import com.company.assembleegameclient.game_.objects.*;
    import source._R_v._f;
    import com.company.assembleegameclient.game_.game.GameSprite;
    import source._R_v.Panel;

    public class GuildChronicle extends GameObject implements _G_4 {

        public function GuildChronicle(_arg1:XML){
            super(_arg1);
            _064 = true;
        }
        public function _C_s(_arg1:GameSprite):Panel{
            return (new _f(_arg1));
        }

    }
}//package com.company.assembleegameclient.game_.objects

