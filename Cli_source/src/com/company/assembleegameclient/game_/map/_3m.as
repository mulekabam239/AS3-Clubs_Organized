﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game_.map._3m

package com.company.assembleegameclient.game_.map{
    import flash.display.Shape;
    import flash.display.GraphicsGradientFill;
    import flash.display.GradientType;
    import com.company.util.GraphicHelper;
    import flash.display.GraphicsPath;

    import flash.display.IGraphicsData;


    public class _3m extends Shape {

        private var _U_G_:GraphicsGradientFill;
        private var _006:GraphicsPath;
        private var _0B_Y_:Vector.<IGraphicsData>;

        public function _3m(){
            this._U_G_ = new GraphicsGradientFill(GradientType.LINEAR, [0, 0], [0, 1], [0, 0xFF], GraphicHelper._0L_0(10, 600));
            this._006 = GraphicHelper._wj(0, 0, 10, 600);
            this._0B_Y_ = new <IGraphicsData>[_U_G_, _006, GraphicHelper.END_FILL];
            graphics.drawGraphicsData(this._0B_Y_);
            visible = false;
        }
    }
}//package com.company.assembleegameclient.game_.map

