﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.map._M_9

package com.company.assembleegameclient.game_.map{
    import flash.display.Shape;
    import flash.display.GraphicsGradientFill;
    import flash.display.GradientType;
    import com.company.util.GraphicHelper;
    import flash.display.GraphicsPath;

    import flash.display.IGraphicsData;


    public class _M_9 extends Shape {

        private const s:Number = (600 / Math.sin((Math.PI / 4)));
        private var _U_G_:GraphicsGradientFill;
        private var _006:GraphicsPath;
        private var _0B_Y_:Vector.<IGraphicsData>;

        public function _M_9(){
            this._U_G_ = new GraphicsGradientFill(GradientType.RADIAL, [0xFFFFFF, 0xFFFFFF, 0xFFFFFF], [0, 0, 0.92], [0, 155, 0xFF], GraphicHelper._0L_0(s, s, 0, ((600 - s) / 2), ((600 - s) / 2)));
            this._006 = GraphicHelper._wj(0, 0, 600, 600);
            this._0B_Y_ = new <IGraphicsData>[_U_G_, _006, GraphicHelper.END_FILL];
            graphics.drawGraphicsData(this._0B_Y_);
            visible = false;
        }
    }
}//package com.company.assembleegameclient.game_.map

