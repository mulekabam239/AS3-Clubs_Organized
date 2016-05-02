// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._011._iD_

package source._011{
    import flash.utils.IDataInput;

    public class _iD_ extends _01Q_ {

        public var type:int;
        public var text:String;

        public function _iD_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.type = _arg1.readInt();
            this.text = _arg1.readUTF();
        }
        override public function toString():String{
            return (formatToString("GLOBAL_NOTIFICATION", "type", "text"));
        }

    }
}//package source._011

