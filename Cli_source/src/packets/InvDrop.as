// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//packets.InvDrop

package packets{
import packets.others._R_q;

import com.company.assembleegameclient.network.net.messages.data._0_3;
    import flash.utils.IDataOutput;

    public class InvDrop extends _R_q {

        public var slotObject_:_0_3;

        public function InvDrop(_arg1:uint){
            this.slotObject_ = new _0_3();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            this.slotObject_.writeToOutput(_arg1);
        }
        override public function toString():String{
            return (formatToString("INVDROP", "slotObject_"));
        }

    }
}//package packets

