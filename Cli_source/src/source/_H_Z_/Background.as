﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._H_Z_.Background

package source._H_Z_{
    import flash.display.Sprite;
    import com.company.assembleegameclient.game_.map.MapView;

    public class Background extends Sprite {

        public static const _0H_W_:int = 0;
        public static const _9F_:int = 1;
        public static const _068:int = 2;
        public static const _0H_v:int = 3;

        public static function _U_q(_arg1:int):Background{
            switch (_arg1)
            {
                case _0H_W_:
                    return (null);
                case _9F_:
                    return (new StarBackground());
                case _068:
                    return (new NexusBackground());
            };
            return (null);
        }

        public function draw(_arg1:MapView, _arg2:int):void{
        }

    }
}//package source._H_Z_

