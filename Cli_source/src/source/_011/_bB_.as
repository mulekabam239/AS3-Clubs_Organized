// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._011._bB_

package source._011{
    import flash.utils.IDataInput;

    public class _bB_ extends _01Q_ {

        public var ownerId_:int;
        public var soundId_:int;

        public function _bB_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.ownerId_ = _arg1.readInt();
            this.soundId_ = _arg1.readUnsignedByte();
        }
        override public function toString():String{
            return (formatToString("PLAYSOUND", "ownerId_", "soundId_"));
        }

    }
}//package source._011

