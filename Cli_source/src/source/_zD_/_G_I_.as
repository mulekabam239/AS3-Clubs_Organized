// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._zD_._G_I_

package source._zD_{
    import source._C__._cM_;
    import com.company.assembleegameclient.game_.charrects.CharacterRectList;
    import source._U_5._01W_;
    import menus._0H_2;

    public class _G_I_ extends _cM_ {

        [Inject]
        public var view:CharacterRectList;
        [Inject]
        public var _0_b:_01W_;

        override public function initialize():void{
            this.view.newCharacter.add(this._8b);
        }
        override public function destroy():void{
            this.view.newCharacter.remove(this._8b);
        }
        private function _8b():void{
            this._0_b.dispatch(new _0H_2());
        }

    }
}//package source._zD_

