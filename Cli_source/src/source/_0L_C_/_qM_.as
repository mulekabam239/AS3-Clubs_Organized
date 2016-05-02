// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0L_C_._qM_

package source._0L_C_{
    import flash.events.Event;

    public class _qM_ extends _qO_ {

        public function _qM_(_arg1:String){
            super(_arg1, "Debug", "OK", null, null);
            addEventListener(_qO_.BUTTON1_EVENT, this.onDialogComplete);
        }
        private function onDialogComplete(_arg1:Event):void{
            if (this.parent != null)
            {
                this.parent.removeChild(this);
            };
        }

    }
}//package source._0L_C_

