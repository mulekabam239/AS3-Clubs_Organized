package menus 
{
    import flash.utils.*;
    import mx.core.*;
    
    [Embed(source="_dy.swf", symbol = "menus._dy")]
    public class _dy extends mx.core.MovieClipLoaderAsset
    {
        public function _dy()
        {
            this._2M_ = menus._S_G_;
            super();
            initialWidth = 16000 / 20;
            initialHeight = 12000 / 20;
            return;
        }

        public override function get movieClipData():flash.utils.ByteArray
        {
            if (_03m == null) 
            {
                _03m = flash.utils.ByteArray(new this._2M_());
            }
            return _03m;
        }

        
        {
            _03m = null;
        }

        public var _2M_:Class;

        private static var _03m:flash.utils.ByteArray=null;
    }
}
