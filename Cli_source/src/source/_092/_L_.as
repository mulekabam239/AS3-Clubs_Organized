// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._092._L_

package source._092{
    import source._qj._8y;
    import source._qj._pn;
    import source._qj.Description;

    public class _L_ extends _8y {

        private var _matcher:_pn;

        public function _L_(_arg1:_pn){
            this._matcher = _arg1;
        }
        override public function matches(_arg1:Object):Boolean{
            return (!(this._matcher.matches(_arg1)));
        }
        override public function describeTo(_arg1:Description):void{
            _arg1.appendText("not ")._ka(this._matcher);
        }

    }
}//package source._092

