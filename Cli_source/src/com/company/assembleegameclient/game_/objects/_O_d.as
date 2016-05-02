﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.objects._O_d

package com.company.assembleegameclient.game_.objects{

    import com.company.assembleegameclient.network.util.ConditionEffect;

    import com.company.assembleegameclient.network.util.*;

    public class _O_d {

        public var bulletType_:int;
        public var objectId_:String;
        public var lifetime_:int;
        public var speed_:int;
        public var size_:int;
        public var minDamage_:int;
        public var maxDamage_:int;
        public var effects_:Vector.<uint> = null;
        public var _0C_c:Boolean;
        public var _wN_:Boolean;
        public var _N_J_:Boolean;
        public var _H_i:Boolean;
        public var _L_f:Boolean;
        public var _3Z_:Boolean;
        public var _0L_a:Boolean;
        public var _D_2:Number;
        public var _0F_t:Number;
        public var _qP_:Number;

        public function _O_d(_arg1:XML){
            var _local2:XML;
            super();
            this.bulletType_ = int(_arg1.@id);
            this.objectId_ = _arg1.ObjectId;
            this.lifetime_ = int(_arg1.LifetimeMS);
            this.speed_ = int(_arg1.Speed);
            this.size_ = ((_arg1.hasOwnProperty("Size")) ? Number(_arg1.Size) : -1);
            if (_arg1.hasOwnProperty("Damage"))
            {
                this.minDamage_ = (this.maxDamage_ = int(_arg1.Damage));
            } else
            {
                this.minDamage_ = int(_arg1.MinDamage);
                this.maxDamage_ = int(_arg1.MaxDamage);
            };
            for each (_local2 in _arg1.ConditionEffect)
            {
                if (this.effects_ == null)
                {
                    this.effects_ = new Vector.<uint>();
                };
                this.effects_.push(ConditionEffect._0I_W_(String(_local2)));
            };
            this._0C_c = _arg1.hasOwnProperty("MultiHit");
            this._wN_ = _arg1.hasOwnProperty("PassesCover");
            this._N_J_ = _arg1.hasOwnProperty("ArmorPiercing");
            this._H_i = _arg1.hasOwnProperty("ParticleTrail");
            this._L_f = _arg1.hasOwnProperty("Wavy");
            this._3Z_ = _arg1.hasOwnProperty("Parametric");
            this._0L_a = _arg1.hasOwnProperty("Boomerang");
            this._D_2 = ((_arg1.hasOwnProperty("Amplitude")) ? Number(_arg1.Amplitude) : 0);
            this._0F_t = ((_arg1.hasOwnProperty("Frequency")) ? Number(_arg1.Frequency) : 1);
            this._qP_ = ((_arg1.hasOwnProperty("Magnitude")) ? Number(_arg1.Magnitude) : 3);
        }
    }
}//package com.company.assembleegameclient.game_.objects

