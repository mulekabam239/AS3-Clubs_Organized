// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._U_._K_a

package source._U_{
    import source._0_p._v;
    import source._eZ_._08b;
    import source._0I_9._0J_r;
    import source._A_G_._v1;
    import source._E_E_._U_A_;
    import source._U_5._D_c;
    import source._F_F_._V_2;
    import source._U_5._06a;
    import source._F_F_._0C_O_;
    import source._U_5._V_l;
    import source._0G__._E_Z_;
    import source._U_5._057;
    import source._0G__._M_y;
    import menus.common.LoadingScreen;
    import source._zD_._0D_h;
    import menus.common.LoadingScreen2;
    import source._zD_._uf;
    import menus.common.ServerScreen2;
    import source._zD_._N_N_;
    import menus.common.CreditsScreen;
    import source._zD_._0F_Q_;
    import menus.common.CurrentCharacterScreen;
    import source._zD_._xF_;
    import menus._05p;
    import source._zD_._V_M_;
    import menus.common.MainScreen;
    import source._zD_.__for;
    import menus.common.LegendsScreen;
    import source._zD_._fy;
    import menus._0H_2;
    import source._zD_._2H_;
    import source._D_d._hj;
    import source._zD_._0D_L_;
    import com.company.assembleegameclient.game_.charrects.CurrentCharacterRect;
    import source._zD_._9M_;
    import com.company.assembleegameclient.game_.charrects.CharacterRectList;
    import source._zD_._G_I_;
    import source._0L_C_._0G_y;
    import source._zD_._1k;
    import source._0L_C_._Z_t;
    import source._zD_._E_G_;
    import menus.common.DeathScreen;
    import source._zD_._09b;
    import menus._0B_m;
    import source._zD_.__else;
    import source._0L_C_._0D_W_;
    import source._zD_._Q_q;
    import source._0L_C_._s7;
    import source._zD_._G_9;
    import menus._02a;
    import source._zD_._jT_;
    import source._0M_H_._sN_;
    import source._0M_H_._R_W_;
    import source._0M_H_._W_O_;
    import source._F_F_._0L_J_;
    import source._zD_._Y_w;
    import source._zD_._yP_;
    import com.company.assembleegameclient.game_.ui.common.InventoryBar;
    import source._zD_._B_9;

    public class _K_a implements _v {

        [Inject]
        public var _O_R_:_08b;
        [Inject]
        public var _Q_l:_0J_r;
        [Inject]
        public var mediatorMap:_v1;
        [Inject]
        public var _1G_:_U_A_;

        public function _K_():void{
            this._1G_.map(_D_c, true)._1N_(_V_2);
            this._1G_.map(_06a)._1N_(_0C_O_);
            this._1G_.map(_V_l)._1N_(_E_Z_);
            this._1G_.map(_057)._1N_(_M_y);
            this.mediatorMap.map(LoadingScreen)._Y_u(_0D_h);
            this.mediatorMap.map(LoadingScreen2)._Y_u(_uf);
            this.mediatorMap.map(ServerScreen2)._Y_u(_N_N_);
            this.mediatorMap.map(CreditsScreen)._Y_u(_0F_Q_);
            this.mediatorMap.map(CurrentCharacterScreen)._Y_u(_xF_);
            this.mediatorMap.map(_05p)._Y_u(_V_M_);
            this.mediatorMap.map(MainScreen)._Y_u(__for);
            this.mediatorMap.map(LegendsScreen)._Y_u(_fy);
            this.mediatorMap.map(_0H_2)._Y_u(_2H_);
            this.mediatorMap.map(_hj)._Y_u(_0D_L_);
            this.mediatorMap.map(CurrentCharacterRect)._Y_u(_9M_);
            this.mediatorMap.map(CharacterRectList)._Y_u(_G_I_);
            this.mediatorMap.map(_0G_y)._Y_u(_1k);
            this.mediatorMap.map(_Z_t)._Y_u(_E_G_);
            this.mediatorMap.map(DeathScreen)._Y_u(_09b);
            this.mediatorMap.map(_0B_m)._Y_u(__else);
            this.mediatorMap.map(_0D_W_)._Y_u(_Q_q);
            this.mediatorMap.map(_s7)._Y_u(_G_9);
            this.mediatorMap.map(_02a)._Y_u(_jT_);
            this._m6();
        }
        private function _m6():void{
            this._O_R_.map(_sN_)._q3(new _sN_());
            this._O_R_.map(_R_W_)._q3(new _R_W_());
            this._1G_.map(_W_O_)._1N_(_0L_J_);
            this.mediatorMap.map(_Y_w)._Y_u(_yP_);
            this.mediatorMap.map(InventoryBar)._Y_u(_B_9);
        }

    }
}//package source._U_

