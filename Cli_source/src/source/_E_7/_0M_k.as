﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._E_7._0M_k

package source._E_7{
    import com.company.assembleegameclient.game_.objects.common.Player;
    import com.company.assembleegameclient.game_.ui._gV_;
    import com.company.assembleegameclient.game_.ui._0M_Y_;
    import com.company.assembleegameclient.game_.ui.common.Inventory;
    import com.company.assembleegameclient.game_.ui._return;
    import com.company.ui.SimpleText;
    import com.company.assembleegameclient.game_.objects.common.ObjectLibrary;
    import flash.filters.DropShadowFilter;
    import com.company.assembleegameclient.network.util._Z_B_;
    import com.company.assembleegameclient.network.appengine._0A_H_;

    public class _0M_k extends _for_ {

        public var player_:Player;
        private var _02y:_gV_;
        private var _023:_0M_Y_;
        private var _F_C_:_0M_Y_;
        private var _e9:Inventory;
        private var _qc:_return;
        private var _05h:SimpleText;
        private var _U_n:SimpleText;

        public function _0M_k(_arg1:String, _arg2:XML, _arg3:_0A_H_){
            super(0x363636, 1, 0xFFFFFF, 1);
            var _local4:int = int(_arg2.ObjectType);
            var _local5:XML = ObjectLibrary._Q_F_[_local4];
            this.player_ = Player._D_U_(_arg1, _arg2);
            this._02y = new _gV_(0xB3B3B3, true, this.player_);
            addChild(this._02y);
            this._023 = new _0M_Y_(176, 16, 14693428, 0x545454, "HP");
            this._023.x = 6;
            this._023.y = 40;
            addChild(this._023);
            this._F_C_ = new _0M_Y_(176, 16, 6325472, 0x545454, "MP");
            this._F_C_.x = 6;
            this._F_C_.y = 64;
            addChild(this._F_C_);
            this._e9 = new Inventory(null, this.player_, "Player Inventory", this.player_._9A_, 12, false);
            this._e9.x = 8;
            this._e9.y = 88;
            addChild(this._e9);
            this._qc = new _return(100, 0x1C1C1C);
            this._qc.x = 6;
            this._qc.y = 228;
            addChild(this._qc);
            var _local6:int = (((_arg3 == null)) ? 0 : _arg3._lr());
            this._05h = new SimpleText(14, 6206769, false, 0, 0, "Myriad Pro");
            this._05h.text = ((((((_local6 + " of 5 Class Quests Completed\n") + "Best Level Achieved: ") + (((_arg3)!=null) ? _arg3._bI_() : 0)) + "\n") + "Best Fame Achieved: ") + (((_arg3)!=null) ? _arg3._0D_E_() : 0));
            this._05h.updateMetrics();
            this._05h.filters = [new DropShadowFilter(0, 0, 0)];
            this._05h.x = 8;
            this._05h.y = (height - 2);
            addChild(this._05h);
            var _local7:int = _Z_B_._F_U_((((_arg3 == null)) ? 0 : _arg3._0D_E_()), 0);
            if (_local7 > 0)
            {
                this._U_n = new SimpleText(13, 16549442, false, 174, 0, "Myriad Pro");
                this._U_n.text = (((("Next Goal: Earn " + _local7) + " Fame\n") + "  with a ") + _local5.@id);
                this._U_n.updateMetrics();
                this._U_n.filters = [new DropShadowFilter(0, 0, 0)];
                this._U_n.x = 8;
                this._U_n.y = (height - 2);
                addChild(this._U_n);
            };
        }
        override public function draw():void{
            this._023.draw(this.player_._aY_, this.player_._L_T_, this.player_._P_7, this.player_._uR_);
            this._F_C_.draw(this.player_._86, this.player_._a7, this.player_._0D_G_, this.player_._dt);
            this._e9.draw(this.player_._zq);
            this._qc._rs((width - 10), 0x1C1C1C);
            super.draw();
        }

    }
}//package source._E_7

