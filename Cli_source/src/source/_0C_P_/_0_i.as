﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0C_P_._0_i

package source._0C_P_{
    import flash.display.Sprite;
    import source._E_7._for_;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import source._E_7._aS_;

    public class _0_i extends Sprite {

        private static var _fO_:_for_;

        public var _W_Y_:String;
        public var _Z_E_:String;
        private var _00R_:SimpleText;

        public function _0_i(_arg1:String, _arg2:String, _arg3:String){
            this._W_Y_ = _arg1;
            this._Z_E_ = _arg3;
            this._00R_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._00R_.text = _arg2;
            this._00R_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
            this._00R_.updateMetrics();
            this._00R_.x = (_N_9.WIDTH + 24);
            this._00R_.y = (((_N_9.HEIGHT / 2) - (this._00R_.height / 2)) - 2);
            this._00R_.mouseEnabled = true;
            this._00R_.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            this._00R_.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
            addChild(this._00R_);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        public function refresh():void{
        }
        private function onMouseOver(_arg1:MouseEvent):void{
            _fO_ = new _aS_(0x272727, 0x828282, null, this._Z_E_, 150);
            stage.addChild(_fO_);
        }
        private function onRollOut(_arg1:MouseEvent):void{
            this.removeToolTip();
        }
        private function onRemovedFromStage(_arg1:Event):void{
            this.removeToolTip();
        }
        private function removeToolTip():void{
            if (((!((_fO_ == null))) && (stage.contains(_fO_))))
            {
                stage.removeChild(_fO_);
                _fO_ = null;
            };
        }

    }
}//package source._0C_P_

