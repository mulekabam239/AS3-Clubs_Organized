// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._U_5._D_L_

package source._U_5{
    import source._sp._aJ_;
    import source._011._wx;

    public class _D_L_ extends _aJ_ {

        private static var instance:_D_L_;

        public function _D_L_(){
            super(_wx);
            instance = this;
        }
        public static function getInstance():_D_L_{
            if (!instance)
            {
                instance = new (_D_L_)();
            };
            return (instance);
        }

    }
}//package source._U_5

