// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._F_F_._V_2

package source._F_F_{
    import source._W_D_.Domain;
    import source._U_5._dd;
    import com.company.assembleegameclient.network.util.loadEmbeds;
    import menus.common.LoadingScreen2;
    import source._0I_9._05b;
    import flash.display.Sprite;

    public class _V_2 {

        [Inject]
        public var domain:Domain;
        [Inject]
        public var _T__:_dd;

        public function execute():void{
            loadEmbeds();
            this._T__.dispatch(this._0E_M_());
        }
        private function _0E_M_():Sprite{
            return (((this.domain._F_N_()) ? new LoadingScreen2() : new _05b()));
        }

    }
}//package source._F_F_

