﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.game._07a

package com.company.assembleegameclient.game_.game{
    import source._4K_.Stats;
    import flash.utils.Timer;
    import flash.geom.Point;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.display.Stage;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import com.company.assembleegameclient.game_.objects.common.Player;
    import com.company.assembleegameclient.game_.tutorial.doneAction;
    import com.company.assembleegameclient.game_.tutorial.Tutorial;
    import com.company.assembleegameclient.game_.map.Square;
    import com.company.util._H_V_;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import source._0C_P_.Options;
    import flash.system.Capabilities;
    import flash.display.StageDisplayState;
    import com.company.assembleegameclient.network.util.TextureRedrawer;

    public class _07a {

        private static const _0_X_:uint = 175;

        private static var _086:Stats = new Stats();
        private static var _nN_:Boolean = false;

        public var gs_:GameSprite;
        private var _07Q_:Boolean = false;
        private var _B_y:Boolean = false;
        private var _0F_e:Boolean = false;
        private var _00u:Boolean = false;
        private var _0I_:Boolean = false;
        private var _S_T_:Boolean = false;
        private var _08R_:Boolean = false;
        private var _wA_:Boolean = false;
        private var _G_v:Boolean = true;
        private var _lD_:Timer;
        private var _Z_W_:uint;
        private var _062:Point;

        public function _07a(_arg1:GameSprite){
            this.gs_ = _arg1;
            this._lD_ = new Timer(_0_X_, 1);
            this._lD_.addEventListener(TimerEvent.TIMER_COMPLETE, this._0C_J_);
            this.gs_.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this.gs_.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        public function clearInput():void{
            this._07Q_ = false;
            this._B_y = false;
            this._0F_e = false;
            this._00u = false;
            this._0I_ = false;
            this._S_T_ = false;
            this._08R_ = false;
            this._wA_ = false;
            this._B_Q_();
        }
        public function _vB_(_arg1:Boolean):void{
            if (this._G_v == _arg1)
            {
                return;
            };
            this._G_v = _arg1;
            this.clearInput();
        }
        private function onAddedToStage(_arg1:Event):void{
            var _local2:Stage = this.gs_.stage;
            _local2.addEventListener(Event.ACTIVATE, this._G_d);
            _local2.addEventListener(Event.DEACTIVATE, this._nb);
            _local2.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
            _local2.addEventListener(KeyboardEvent.KEY_UP, this._H_H_);
            _local2.addEventListener(MouseEvent.MOUSE_WHEEL, this._lb);
            this.gs_.map_.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
            this.gs_.map_.addEventListener(MouseEvent.MOUSE_UP, this._0_5);
            this.gs_.map_.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        private function onRemovedFromStage(_arg1:Event):void{
            var _local2:Stage = this.gs_.stage;
            _local2.removeEventListener(Event.ACTIVATE, this._G_d);
            _local2.removeEventListener(Event.DEACTIVATE, this._nb);
            _local2.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
            _local2.removeEventListener(KeyboardEvent.KEY_UP, this._H_H_);
            _local2.removeEventListener(MouseEvent.MOUSE_WHEEL, this._lb);
            this.gs_.map_.removeEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
            this.gs_.map_.removeEventListener(MouseEvent.MOUSE_UP, this._0_5);
            this.gs_.map_.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        private function _G_d(_arg1:Event):void{
        }
        private function _nb(_arg1:Event):void{
            this.clearInput();
        }
        private function onMouseDown(_arg1:MouseEvent):void{
            var _local2:Player = this.gs_.map_.player_;
            if (_local2 == null)
            {
                return;
            };
            if (this._lD_.running == false)
            {
                this._Z_W_ = 1;
                this._lD_.start();
            } else
            {
                this._Z_W_++;
            };
            if (!this._G_v)
            {
                return;
            };
            if (_arg1.shiftKey)
            {
                _local2._lY_(_arg1.localX, _arg1.localY);
                return;
            };
            doneAction(this.gs_, Tutorial._9Z_);
            var _local3:Number = Math.atan2(_arg1.localY, _arg1.localX);
            _local2._O_7(_local3);
            this._08R_ = true;
        }
        private function _0C_J_(_arg1:TimerEvent):void{
            var _local2:Point;
            if (this._Z_W_ > 1)
            {
                _local2 = this.gs_.map_.pSTopW(this.gs_.map_.mouseX, this.gs_.map_.mouseY);
            };
        }
        private function _0_5(_arg1:MouseEvent):void{
            this._08R_ = false;
        }
        private function _lb(_arg1:MouseEvent):void{
            if (((((this.gs_) && (this.gs_._V_1))) && (this.gs_._V_1._F_)))
            {
                if (_arg1.delta > 0)
                {
                    this.gs_._V_1._F_._K_r();
                } else
                {
                    this.gs_._V_1._F_._w_();
                };
            };
        }
        private function onEnterFrame(_arg1:Event):void{
            var _local2:Number;
            var _local3:Player;
            doneAction(this.gs_, Tutorial._xX_);
            if (((this._G_v) && (((this._08R_) || (this._wA_)))))
            {
                _local2 = Math.atan2(this.gs_.map_.mouseY, this.gs_.map_.mouseX);
                _local3 = this.gs_.map_.player_;
                if (_local3 != null)
                {
                    _local3._O_7(_local2);
                };
            };
        }
        private function _0A_Y_(_arg1:KeyboardEvent):void{
            var _local4:Square;
            var _local2:Stage = this.gs_.stage;
            switch (_arg1.keyCode)
            {
                case _H_V_.F1:
                case _H_V_.F2:
                case _H_V_.F3:
                case _H_V_.F4:
                case _H_V_.F5:
                case _H_V_.F6:
                case _H_V_.F7:
                case _H_V_.F8:
                case _H_V_.F9:
                case _H_V_.F10:
                case _H_V_.F11:
                case _H_V_.F12:
                case _H_V_.INSERT:
                    break;
                default:
                    if (_local2.focus != null)
                    {
                        return;
                    };
            };
            var _local3:Player = this.gs_.map_.player_;
            switch (_arg1.keyCode)
            {
                case Parameters.data_.moveUp:
                    doneAction(this.gs_, Tutorial._04m);
                    this._0F_e = true;
                    break;
                case Parameters.data_.moveDown:
                    doneAction(this.gs_, Tutorial._03b);
                    this._00u = true;
                    break;
                case Parameters.data_.moveLeft:
                    doneAction(this.gs_, Tutorial._S_B_);
                    this._07Q_ = true;
                    break;
                case Parameters.data_.moveRight:
                    doneAction(this.gs_, Tutorial._0A_j);
                    this._B_y = true;
                    break;
                case Parameters.data_.rotateLeft:
                    if (!Parameters.data_.allowRotation) break;
                    doneAction(this.gs_, Tutorial._0B_d);
                    this._0I_ = true;
                    break;
                case Parameters.data_.rotateRight:
                    if (!Parameters.data_.allowRotation) break;
                    doneAction(this.gs_, Tutorial._95);
                    this._S_T_ = true;
                    break;
                case Parameters.data_.resetToDefaultCameraAngle:
                    Parameters.data_.cameraAngle = Parameters.data_.defaultCameraAngle;
                    Parameters.save();
                    break;
                case Parameters.data_.useSpecial:
                    _local3._lY_(this.gs_.map_.mouseX, this.gs_.map_.mouseY);
                    break;
                case Parameters.data_.autofireToggle:
                    this._wA_ = !(this._wA_);
                    break;
                case Parameters.data_.useInvSlot1:
                    this.useItem(4);
                    break;
                case Parameters.data_.useInvSlot2:
                    this.useItem(5);
                    break;
                case Parameters.data_.useInvSlot3:
                    this.useItem(6);
                    break;
                case Parameters.data_.useInvSlot4:
                    this.useItem(7);
                    break;
                case Parameters.data_.useInvSlot5:
                    this.useItem(8);
                    break;
                case Parameters.data_.useInvSlot6:
                    this.useItem(9);
                    break;
                case Parameters.data_.useInvSlot7:
                    this.useItem(10);
                    break;
                case Parameters.data_.useInvSlot8:
                    this.useItem(11);
                    break;
                case Parameters.data_.miniMapZoomOut:
                    if (this.gs_._V_1._F_ == null) break;
                    this.gs_._V_1._F_._w_();
                    break;
                case Parameters.data_.miniMapZoomIn:
                    if (this.gs_._V_1._F_ == null) break;
                    this.gs_._V_1._F_._K_r();
                    break;
                case Parameters.data_.togglePerformanceStats:
                    this.togglePerformanceStats();
                    break;
                case Parameters.data_.escapeToNexus:
                case Parameters.data_.escapeToNexus2:
                    this.gs_.gsc_._M_6();
                    Parameters.data_.needsRandomRealm = false;
                    Parameters.save();
                    break;
                case Parameters.data_.options:
                    this.clearInput();
                    this.gs_.addChild(new Options(this.gs_));
                    break;
                case Parameters.data_.toggleCentering:
                    Parameters.data_.centerOnPlayer = !(Parameters.data_.centerOnPlayer);
                    Parameters.save();
                    break;
                case Parameters.data_.toggleFullscreen:
                    if (Capabilities.playerType == "Desktop")
                    {
                        Parameters.data_.fullscreenMode = !(Parameters.data_.fullscreenMode);
                        Parameters.save();
                        _local2.displayState = ((Parameters.data_.fullscreenMode) ? "fullScreenInteractive" : StageDisplayState.NORMAL);
                    };
                    break;
            };
            if (Parameters._1h)
            {
                switch (_arg1.keyCode)
                {
                    case _H_V_.F2:
                        this._0D_2();
                        break;
                    case _H_V_.F3:
                        Parameters._ih = !(Parameters._ih);
                        break;
                    case _H_V_.F4:
                        this.gs_.map_.mapOverlay_.visible = !(this.gs_.map_.mapOverlay_.visible);
                        this.gs_.map_.partyOverlay_.visible = !(this.gs_.map_.partyOverlay_.visible);
                        break;
                };
            };
            if (!Parameters.isTesting)
            {
                switch (_arg1.keyCode)
                {
                    case _H_V_.F6:
                        TextureRedrawer.clearCache();
                        Parameters._Q_b = ((Parameters._Q_b + 1) % 7);
                        this.gs_.textBox_.addText(Parameters.SendError, ("Projectile Color Type: " + Parameters._Q_b));
                        break;
                    case _H_V_.F7:
                        for each (_local4 in this.gs_.map_.squares_)
                        {
                            if (_local4 != null)
                            {
                                _local4.faces_.length = 0;
                            };
                        };
                        Parameters._R_P_ = ((Parameters._R_P_ + 1) % 2);
                        this.gs_.textBox_.addText(Parameters.SendClient, ("Blend type: " + Parameters._R_P_));
                        break;
                    case _H_V_.F8:
                        Parameters.data_.surveyDate = 0;
                        Parameters.data_.needsSurvey = true;
                        Parameters.data_.playTimeLeftTillSurvey = 5;
                        Parameters.data_.surveyGroup = "testing";
                        break;
                    case _H_V_.F9:
                        Parameters._Q_w = !(Parameters._Q_w);
                        break;
                    case _H_V_.F12:
                        this.gs_.textBox_.addText(Parameters.SendInfo, "Server Chat");
                        this.gs_.textBox_.addText(Parameters.SendClient, "Client Chat");
                        this.gs_.textBox_.addText(Parameters.SendHelp, "Help Chat");
                        this.gs_.textBox_.addText(Parameters.SendError, "Error Chat");
                        this.gs_.textBox_.addText("#Enemy Name", "Enemy Chat");
                        this.gs_.textBox_.addText("@Admin", "Admin Chat");
                        this.gs_.textBox_.addText("Player", "Player Chat");
                        this.gs_.textBox_._ro("Player", -1, 0, "Crunchy", "Tell from another Player");
                        this.gs_.textBox_._ro("Crunchy", -1, 0, "Player", "Tell to another Player");
                        this.gs_.textBox_._ro("Crunchy", -1, 0, Parameters.SendGuild, "Guild Chat");
                        break;
                    case _H_V_.C:
                        this.gs_.textBox_.addText(Parameters.SendError, "Cheated");
                        _local3._hh = 100;
                        break;
                };
            };
            this._B_Q_();
        }
        private function _H_H_(_arg1:KeyboardEvent):void{
            switch (_arg1.keyCode)
            {
                case Parameters.data_.moveUp:
                    this._0F_e = false;
                    break;
                case Parameters.data_.moveDown:
                    this._00u = false;
                    break;
                case Parameters.data_.moveLeft:
                    this._07Q_ = false;
                    break;
                case Parameters.data_.moveRight:
                    this._B_y = false;
                    break;
                case Parameters.data_.rotateLeft:
                    this._0I_ = false;
                    break;
                case Parameters.data_.rotateRight:
                    this._S_T_ = false;
                    break;
            };
            this._B_Q_();
        }
        private function _B_Q_():void{
            var _local1:Player = this.gs_.map_.player_;
            if (_local1 != null)
            {
                if (this._G_v)
                {
                    _local1._vr((((this._S_T_) ? 1 : 0) - ((this._0I_) ? 1 : 0)), (((this._B_y) ? 1 : 0) - ((this._07Q_) ? 1 : 0)), (((this._00u) ? 1 : 0) - ((this._0F_e) ? 1 : 0)));
                } else
                {
                    _local1._vr(0, 0, 0);
                };
            };
        }
        private function useItem(_arg1:int):void{
            if ((((this.gs_._V_1._02y == null)) || ((this.gs_._V_1._02y._e9 == null))))
            {
                return;
            };
            this.gs_._V_1._02y._e9.useItem(_arg1);
        }
        private function togglePerformanceStats():void{
            if (this.gs_.contains(_086))
            {
                this.gs_.removeChild(_086);
                this.gs_.removeChild(this.gs_.gsc_._0l);
                this.gs_.gsc_._rT_();
            } else
            {
                this.gs_.addChild(_086);
                this.gs_.gsc_._9G_();
                this.gs_.gsc_._0l.y = _086.height;
                this.gs_.addChild(this.gs_.gsc_._0l);
            };
        }
        private function _0D_2():void{
            Parameters._0F_o = !(Parameters._0F_o);
            if (Parameters._0F_o)
            {
                this.gs_._V_1.visible = false;
                this.gs_.textBox_._01P_.visible = false;
            } else
            {
                this.gs_._V_1.visible = true;
                this.gs_.textBox_._01P_.visible = true;
            };
        }

    }
}//package com.company.assembleegameclient.game_.game

