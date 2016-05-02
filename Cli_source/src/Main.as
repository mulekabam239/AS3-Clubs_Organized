// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Main

package {
    import flash.display.Sprite;
    import source._0_p._L_y;

import flash.display.StageQuality;
import flash.events.Event;
    import flash.display.StageScaleMode;
    import source._U_5._D_c;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import source._G_A_._8P_;
    import source._C__._07U_;
    import source._T_o._083;
    import source._G_A_._F_y;
    import source._9u._074;
    import source._C_5._tt;
    import source._U_._K_a;
    import source._R_Q_._0K_S_;
    import source._I_j._V_4;
    import source._05G_._X_G_;
    import flash.system.Capabilities;

    [SWF(width="800", height="600", frameRate="60", backgroundColor="#000000")]
    public class Main extends Sprite {

        protected var context:_L_y;

        public function Main(){
            if (stage)
            {
                this.setup();
            } else
            {
                addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            };
        }
        private function onAddedToStage(_arg1:Event):void{
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this.setup();
        }
        private function setup():void{
            this._4y();
            this._i1();
            stage.scaleMode = StageScaleMode.EXACT_FIT;
            var _local1:_D_c = this.context._O_R_.getInstance(_D_c);
            _local1.dispatch();
            this._06p();
            stage.quality = StageQuality.LOW; //remove this line if u dont want forcelowquality.
        }
        private function _4y():void{
            Parameters.root = stage.root;
        }
        private function _i1():void{
            this.context = new _8P_();
            this.context.extend(_07U_).extend(_083)._K_(_F_y)._K_(_074)._K_(_tt)._K_(_K_a)._K_(_0K_S_)._K_(_V_4)._K_(_X_G_)._K_(this);
        }
        private function _06p():void{
            if (Capabilities.playerType == "Desktop")
            {
                Parameters.data_.fullscreenMode = false;
                Parameters.save();
            };
        }

    }
}//package 

