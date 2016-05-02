// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._R_v._f

package source._R_v{
    import com.company.assembleegameclient.game_.game.GameSprite;
    import source._sP_._07x;
    import flash.events.MouseEvent;

    public class _f extends _X_i {

        public function _f(_arg1:GameSprite){
            super(_arg1, "Guild Chronicle", "View");
        }
        override protected function onButtonClick(_arg1:MouseEvent):void{
            gs_.mui_.clearInput();
            gs_.addChild(new _07x(gs_));
        }

    }
}//package source._R_v

