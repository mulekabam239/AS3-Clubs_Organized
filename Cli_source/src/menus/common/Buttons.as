﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//menus.Buttons

package menus.common{
    import flash.display.Sprite;
    import flash.geom.ColorTransform;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.utils.getTimer;
    import com.company.util.MoreColorUtil;
    import sounds._5T_;

    public class Buttons extends Sprite {

        protected static const _0A_8:ColorTransform = new ColorTransform(1, (220 / 0xFF), (133 / 0xFF));

        protected var _4p:ColorTransform = null;
        protected var text_:SimpleText;
        protected var _U_r:Boolean;
        private var _0H_X_:Number;
        private var _N_a:Number;

        public function Buttons(_arg1:String, _arg2:int, _arg3:Boolean){
            name = _arg1;
            this.text_ = new SimpleText(_arg2, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this.text_.setBold(true);
            this.text_.text = _arg1.toLowerCase();
            this.text_.updateMetrics();
            this.text_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            addChild(this.text_);
            this._U_r = _arg3;
            this._0H_X_ = width;
            this._N_a = height;
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            addEventListener(MouseEvent.CLICK, this._09t);
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private function onAddedToStage(_arg1:Event):void{
            if (this._U_r)
            {
                addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            };
        }
        private function onRemovedFromStage(_arg1:Event):void{
            if (this._U_r)
            {
                removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            };
        }
        private function onEnterFrame(_arg1:Event):void{
            var _local2:Number = (1.05 + (0.05 * Math.sin((getTimer() / 200))));
            this.text_.scaleX = _local2;
            this.text_.scaleY = _local2;
            this.text_.x = ((this._0H_X_ / 2) - (this.text_.width / 2));
            this.text_.y = ((this._N_a / 2) - (this.text_.height / 2));
        }
        public function _037(_arg1:ColorTransform):void{
            if (_arg1 == this._4p)
            {
                return;
            };
            this._4p = _arg1;
            if (this._4p == null)
            {
                this.text_.transform.colorTransform = MoreColorUtil.identity;
            } else
            {
                this.text_.transform.colorTransform = this._4p;
            };
        }
        protected function onMouseOver(_arg1:MouseEvent):void{
            this._037(_0A_8);
        }
        protected function onMouseOut(_arg1:MouseEvent):void{
            this._037(null);
        }
        protected function _09t(_arg1:MouseEvent):void{
            _5T_.play("button_click");
        }

    }
}//package menus

