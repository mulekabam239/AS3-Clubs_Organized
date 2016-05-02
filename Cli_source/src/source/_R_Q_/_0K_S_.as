// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._R_Q_._0K_S_

package source._R_Q_{
    import source._0_p._v;
    import source._0_p._L_y;
    import source._A_G_._v1;
    import source._0I_9._0J_r;
    import source._6r._0F_X_;
    import source._6r._iy;

    public class _0K_S_ implements _v {

        [Inject]
        public var context:_L_y;
        [Inject]
        public var mediatorMap:_v1;
        [Inject]
        public var _Q_l:_0J_r;

        public function _K_():void{
            this.mediatorMap.map(_0F_X_)._Y_u(_iy);
            this.context._iL_._3a(this.init);
        }
        private function init():void{
            this._Q_l.tooltips.addChild(new _0F_X_());
        }

    }
}//package source._R_Q_

