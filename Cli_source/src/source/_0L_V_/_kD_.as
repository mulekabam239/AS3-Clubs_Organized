﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0L_V_._kD_

package source._0L_V_{
    import flash.display.Sprite;
    import source._sp._aJ_;
    import source._S_K_._u3;
    import flash.events.MouseEvent;

    public class _kD_ extends Sprite {

        public static var _dC_:Class = _00I_;

        private var _0G_2:Sprite;
        public var close:_aJ_;

        public function _kD_(){
            this._bt();
            this._Q_G_();
            this.close = new _u3(this._0G_2, MouseEvent.CLICK);
        }
        private function _bt():void{
            addChild(new _dC_());
        }
        private function _Q_G_():void{
            this._0G_2 = new Sprite();
            this._0G_2.graphics.beginFill(0xFF0000, 0);
            this._0G_2.graphics.drawRect(0, 0, 30, 30);
            this._0G_2.graphics.endFill();
            this._0G_2.buttonMode = true;
            this._0G_2.x = 550;
            this._0G_2.y = 30;
            addChild(this._0G_2);
        }

    }
}//package source._0L_V_

