// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//menus.LoadingScreen2

package menus.common{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import source._sp._aJ_;
    import com.company.rotmg.graphics.ScreenGraphic;
    import flash.text.TextFieldAutoSize;
    import flash.filters.DropShadowFilter;
    import flash.events.Event;
    import source._qN_.Account;

    public class LoadingScreen2 extends Sprite {

        private var _j7:SimpleText;
        public var _J_b:_aJ_;

        public function LoadingScreen2(){
            addChild(new ScreenGraphic());
            this._j7 = new SimpleText(30, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this._j7.setBold(true);
            this._j7.htmlText = '<p align="center">Loading...</p>';
            this._j7.autoSize = TextFieldAutoSize.CENTER;
            this._j7.updateMetrics();
            this._j7.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
            addChild(this._j7);
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this._J_b = new _aJ_();
        }
        protected function onAddedToStage(_arg1:Event):void{
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            stage;
            this._j7.x = ((800 / 2) - (this._j7.width / 2));
            this._j7.y = 526;
            this._D_I_();
        }
        private function _D_I_():void{
            Account.load(stage, this._0L_);
        }
        private function _0L_():void{
            this._J_b.dispatch();
        }

    }
}//package menus

