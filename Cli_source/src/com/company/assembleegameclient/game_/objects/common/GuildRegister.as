﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.objects.GuildRegister

package com.company.assembleegameclient.game_.objects.common{
import com.company.assembleegameclient.game_.objects.*;
    import source._R_v._04X_;
    import com.company.assembleegameclient.game_.game.GameSprite;
    import source._R_v.Panel;

    public class GuildRegister extends GameObject implements _G_4 {

        public function GuildRegister(_arg1:XML){
            super(_arg1);
            _064 = true;
        }
        public function _C_s(_arg1:GameSprite):Panel{
            return (new _04X_(_arg1));
        }

    }
}//package com.company.assembleegameclient.game_.objects

