// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._df._04M_

package source._df{
    import com.company.assembleegameclient.network.util.TextureRedrawer;
    import flash.display.BitmapData;

    public class _04M_ extends Preview {

        public function _04M_(_arg1:int, _arg2:int){
            super(_arg1, _arg2);
        }
        override public function redraw():void{
            super.redraw();
            if (_lT_ == null)
            {
                return;
            };
            var _local1:BitmapData = TextureRedrawer.redraw(_lT_, size_, true, 0, 0, false);
            bitmap_.bitmapData = _local1;
        }

    }
}//package source._df

