// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0G__._ci

package source._0G__{
    import flash.display.DisplayObjectContainer;
    import source._02b._6E_;
    import com.company.assembleegameclient.network.parameters.Parameters;

    public class _ci {

        [Inject]
        public var _fR_:DisplayObjectContainer;
        [Inject]
        public var analytics:_6E_;

        public function execute():void{
            this.analytics.init(this._fR_.stage, Parameters._05w());
        }

    }
}//package source._0G__

