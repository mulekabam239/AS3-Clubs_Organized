﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.ui._jM_

package com.company.assembleegameclient.game_.ui.common{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import sounds._5T_;

    public class TextButton extends Sprite {

        public var text_:SimpleText;
        public var _c9:int;
        public var _I_x:int;
        public var _S_4:uint = 0xFFFFFF;

        public function TextButton(_arg1:int, _arg2:Boolean, _arg3:String){
            this.text_ = new SimpleText(_arg1, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this.text_.setBold(_arg2);
            this.text_.text = _arg3;
            this.text_.updateMetrics();
            addChild(this.text_);
            this.text_.filters = [new DropShadowFilter(0, 0, 0)];
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            addEventListener(MouseEvent.CLICK, this.onClick);
        }
        public function _bu(_arg1:String):void{
            this.text_.text = _arg1;
            this.text_.updateMetrics();
            this._02W_(0xB3B3B3);
            mouseEnabled = false;
            mouseChildren = false;
        }
        public function _gp(_arg1:uint):void{
            this.text_.setColor(_arg1);
        }
        public function _02W_(_arg1:uint):void{
            this._S_4 = _arg1;
            this._gp(this._S_4);
        }
        private function onMouseOver(_arg1:MouseEvent):void{
            this._gp(16768133);
        }
        private function onMouseOut(_arg1:MouseEvent):void{
            this._gp(this._S_4);
        }
        private function onClick(_arg1:MouseEvent):void{
            _5T_.play("button_click");
        }

    }
}//package com.company.assembleegameclient.game_.ui

