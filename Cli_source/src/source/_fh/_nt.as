﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._fh._nt

package source._fh{
    import com.company.assembleegameclient.game_.map._X_l;
    import flash.utils.getTimer;
    import flash.events.MouseEvent;
    import source._E_7._ap;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import source._E_7._C_8;
    import com.company.assembleegameclient.game_.objects.common.GameObject;
    import source._E_7._for_;
    import com.company.assembleegameclient.game_.map.Quest;
    import com.company.assembleegameclient.game_.map.MapView;

    public class _nt extends _rB_ {

        public var map_:_X_l;

        public function _nt(_arg1:_X_l){
            super(16352321, 12919330, true);
            this.map_ = _arg1;
        }
        public function refreshToolTip():void{
            _V_B_(this.getToolTip(go_, getTimer()));
        }
        override protected function onMouseOver(_arg1:MouseEvent):void{
            super.onMouseOver(_arg1);
            this.refreshToolTip();
        }
        override protected function onMouseOut(_arg1:MouseEvent):void{
            super.onMouseOut(_arg1);
            this.refreshToolTip();
        }
        private function getToolTip(_arg1:GameObject, _arg2:int):_for_{
            if ((((_arg1 == null)) || ((_arg1.texture_ == null))))
            {
                return (null);
            };
            if (this._01(_arg2))
            {
                return (new _ap(go_));
            };
            if (Parameters.data_.showQuestPortraits)
            {
                return (new _C_8(_arg1));
            };
            return (null);
        }
        private function _01(_arg1:int):Boolean{
            var _local2:Quest = this.map_.quest_;
            return (((_68) || (_local2.isNew(_arg1))));
        }
        override public function draw(_arg1:int, _arg2:MapView):void{
            var _local4:Boolean;
            var _local5:Boolean;
            var _local3:GameObject = this.map_.quest_.getObject(_arg1);
            if (_local3 != go_)
            {
                _bz(_local3);
                _V_B_(this.getToolTip(_local3, _arg1));
            } else
            {
                if (go_ != null)
                {
                    _local4 = (_fO_ is _ap);
                    _local5 = this._01(_arg1);
                    if (_local4 != _local5)
                    {
                        _V_B_(this.getToolTip(_local3, _arg1));
                    };
                };
            };
            super.draw(_arg1, _arg2);
        }

    }
}//package source._fh

