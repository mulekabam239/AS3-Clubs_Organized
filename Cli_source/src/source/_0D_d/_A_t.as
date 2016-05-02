﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._0D_d._A_t

package source._0D_d{
    import com.company.assembleegameclient.network.appengine._0B_u;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.company.assembleegameclient.network.parameters.Parameters;
    import source._zo._8C_;
    import source._zo._mS_;
    import com.company.util._H_U_;
    import source._qN_.Account;

    public class _A_t extends Frame {

        private var name_:TextInput;
        private var _zH_:_0B_u = null;

        public function _A_t(){
            super("Choose a unique account name", "Cancel", "Choose", "/newChooseName");
            this.name_ = new TextInput("Name", false, "");
            this.name_.inputText_.restrict = "A-Za-z";
            this.name_.inputText_.maxChars = 10;
            _vO_(this.name_);
            _0D_I_("Maximum 10 characters");
            _0D_I_("No numbers, spaces or punctuation");
            _0D_I_("Racism or profanity gets you banned");
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._J_p);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new Event(Event.CANCEL));
        }
        private function _J_p(_arg1:MouseEvent):void{
            if (this.name_.text().length < 1)
            {
                this.name_._0B_T_("Name too short");
                return;
            };
            var _local2:_0B_u = new _0B_u(Parameters._fK_(), "/account", true);
            _local2.addEventListener(_8C_.GENERIC_DATA, this._E_0);
            _local2.addEventListener(_mS_.TEXT_ERROR, this._06Q_);
            var _local3:Object = {"name":this.name_.text()};
            _H_U_._t2(_local3, Account._get().credentials());
            _local2.sendRequest("setName", _local3);
            _pW_();
        }
        private function _E_0(_arg1:_8C_):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _06Q_(_arg1:_mS_):void{
            this.name_._0B_T_(_arg1.text_);
            _for();
        }

    }
}//package source._0D_d

