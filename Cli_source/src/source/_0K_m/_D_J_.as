﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0K_m._D_J_

package source._0K_m{
    public class _D_J_ {

        public var id:String;
        public var particle:String;
        public var cooldown:Number;
        public var color:uint;
        public var rate:Number;
        public var speed:Number;
        public var speedVariance:Number;
        public var spread:Number;
        public var life:Number;
        public var lifeVariance:Number;
        public var size:int;
        public var _hX_:Number;
        public var rise:Number;
        public var riseVariance:Number;
        public var riseAcc:Number;
        public var rangeX:int;
        public var rangeY:int;
        public var zOffset:Number;
        public var bitmapFile:String;
        public var bitmapIndex:uint;

        public function _D_J_(_arg1:XML){
            this.id = _arg1.toString();
            this.particle = _arg1.@particle;
            this.cooldown = _arg1.@cooldown;
            this.color = _arg1.@color;
            this.rate = ((_arg1.@rate) || (5));
            this.speed = ((_arg1.@speed) || (0));
            this.speedVariance = ((_arg1.@speedVariance) || (0.5));
            this.spread = ((_arg1.@spread) || (0));
            this.life = ((_arg1.@life) || (1));
            this.lifeVariance = ((_arg1.@lifeVariance) || (0));
            this.size = ((_arg1.@size) || (3));
            this.rise = ((_arg1.@rise) || (3));
            this.riseVariance = ((_arg1.@riseVariance) || (0));
            this.riseAcc = ((_arg1.@riseAcc) || (0));
            this.rangeX = ((_arg1.@rangeX) || (0));
            this.rangeY = ((_arg1.@rangeY) || (0));
            this.zOffset = ((_arg1.@zOffset) || (0));
            this.bitmapFile = _arg1.@bitmapFile;
            this.bitmapIndex = _arg1.@bitmapIndex;
        }
    }
}//package source._0K_m

