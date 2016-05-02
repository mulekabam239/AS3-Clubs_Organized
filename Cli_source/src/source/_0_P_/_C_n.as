// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0_P_._C_n

package source._0_P_{
    import com.company.assembleegameclient.game_.objects._Z_H_;

    public class _C_n {

        public var time_:int;
        public var _Y_D_:_Z_H_;

        public function _C_n(_arg1:XML){
            this.time_ = int((Number(_arg1.@time) * 1000));
            this._Y_D_ = new _Z_H_(_arg1);
        }
    }
}//package source._0_P_

