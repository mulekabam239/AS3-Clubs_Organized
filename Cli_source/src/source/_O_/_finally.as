// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._O_._finally

package source._O_{
    import flash.display.DisplayObjectContainer;
    import source._s3._im;

    public class _finally {

        [Inject]
        public var _fR_:DisplayObjectContainer;
        [Inject]
        public var viewManager:_im;

        [PostConstruct]
        public function init():void{
            this.viewManager._tP_(this._fR_);
        }

    }
}//package source._O_

