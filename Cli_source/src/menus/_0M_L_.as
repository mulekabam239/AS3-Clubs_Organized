﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//menus._0M_L_

package menus{
import menus.common.ServerScreen;

import flash.display.Sprite;

    import com.company.assembleegameclient.network.net.Server;
    import flash.events.MouseEvent;
    import com.company.assembleegameclient.network.parameters.Parameters;


    public class _0M_L_ extends Sprite {

        private var _break:Vector.<ServerScreen>;

        public function _0M_L_(_arg1:Vector.<Server>){
            var _local4:Server;
            this._break = new Vector.<ServerScreen>();
            super();
            var _local2:ServerScreen = new ServerScreen(null);
            _local2.setSelected(true);
            _local2.x = ((ServerScreen.WIDTH / 2) + 2);
            _local2.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
            addChild(_local2);
            this._break.push(_local2);
            var _local3:int = 2;
            for each (_local4 in _arg1)
            {
                _local2 = new ServerScreen(_local4);
                if (_local4.name_ == Parameters.data_.preferredServer)
                {
                    this.setSelected(_local2);
                };
                _local2.x = ((_local3 % 2) * (ServerScreen.WIDTH + 4));
                _local2.y = (int((_local3 / 2)) * (ServerScreen.HEIGHT + 4));
                _local2.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
                addChild(_local2);
                this._break.push(_local2);
                _local3++;
            };
        }
        private function onMouseDown(_arg1:MouseEvent):void{
            var _local2:ServerScreen = (_arg1.target as ServerScreen);
            this.setSelected(_local2);
            Parameters.data_.preferredServer = _local2.value_;
            Parameters.save();
        }
        private function setSelected(_arg1:ServerScreen):void{
            var _local2:ServerScreen;
            for each (_local2 in this._break)
            {
                _local2.setSelected(false);
            };
            _arg1.setSelected(true);
        }

    }
}//package menus

