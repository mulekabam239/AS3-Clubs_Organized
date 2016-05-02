﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//sounds._5T_

package sounds{
    import flash.utils.Dictionary;
    import flash.media.Sound;
    import flash.net.URLRequest;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import flash.events.IOErrorEvent;
    import flash.media.SoundTransform;
    import flash.media.SoundChannel;
    import flash.events.Event;

    public class _5T_ {

        public static var _0H_k:Dictionary = new Dictionary();
        private static var _04b:Dictionary = new Dictionary(true);

        public static function load(_arg1:String):Sound{
            var _local2:Sound = _0H_k[_arg1];
            if (_local2 != null)
            {
                return (_local2);
            };
            var _local3:URLRequest = new URLRequest((((("http://" + "realmofthemadgod.appspot.com/") + "/sfx/") + _arg1) + ".mp3"));
            _local2 = new Sound();
            _local2.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
            _local2.load(_local3);
            _0H_k[_arg1] = _local2;
            return (_local2);
        }
        public static function play(name:String, volume:Number=1, isFX:Boolean=true):void{
            var actualVolume:Number;
            var trans:SoundTransform;
            var channel:SoundChannel;
            var sound:Sound = load(name);
            try
            {
                actualVolume = ((((((Parameters.data_.playSFX) && (isFX))) || (((!(isFX)) && (Parameters.data_.playPewPew))))) ? volume : 0);
                trans = new SoundTransform(actualVolume);
                channel = sound.play(0, 0, trans);
                channel.addEventListener(Event.SOUND_COMPLETE, _J_M_, false, 0, true);
                _04b[channel] = volume;
            } catch(error:Error)
            {
            };
        }
        private static function _J_M_(_arg1:Event):void{
            var _local2:SoundChannel = (_arg1.target as SoundChannel);
            delete _04b[_local2];
        }
        public static function _02r():void{
            var _local1:SoundChannel;
            var _local2:SoundTransform;
            for each (_local1 in _04b)
            {
                _local2 = _local1.soundTransform;
                _local2.volume = ((Parameters.data_.playSFX) ? _04b[_local1] : 0);
                _local1.soundTransform = _local2;
            };
        }
        public static function onIOError(_arg1:IOErrorEvent):void{
        }

    }
}//package sounds

