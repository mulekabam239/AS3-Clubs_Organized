// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._D_d._0H_J_

package source._D_d{
    import source._D_d._M_u;

    import com.company.assembleegameclient.game_.map._pf;
    import com.company.util._L_2;

    import source._D_d.*;

    class _0H_J_ extends _E_m {

        public function _0H_J_(){
            var _local1:String;
            var _local3:int;
            var _local4:_Q_S_;
            super(_M_u._6h);
            var _local2:Vector.<String> = new Vector.<String>();
            for (_local1 in _pf._pb)
            {
                _local2.push(_local1);
            };
            _local2.sort(_L_2._L_O_);
            for each (_local1 in _local2)
            {
                _local3 = _pf._pb[_local1];
                _local4 = new _Q_S_(_pf._Q_F_[_local3]);
                _08M_(_local4);
            };
        }
    }
}//package source._D_d

