﻿package source._qN_
{
import source._00g.WebAccount;

import com.company.assembleegameclient.network.parameters.Parameters;

import flash.display.Stage;
import flash.display.Sprite;

public class Account
{

    private static var _N_7:Account = null;


    public static function load(_arg1:Stage, _arg2:Function):void
    {
        _N_7 = new WebAccount();
        _N_7.internalLoad(_arg1, _arg2);
    }

    public static function _get():Account
    {
        if (_N_7 == null)
        {
            _N_7 = new WebAccount();
        };
        return (_N_7);
    }


    public function guid():String
    {
        return (null);
    }

    public function password():String
    {
        return ("");
    }

    public function secret():String
    {
        return ("");
    }

    public function credentials():Object
    {
        return (null);
    }

    public function isRegistered():Boolean
    {
        return (false);
    }

    public function modify(_arg1:String, _arg2:String, _arg3:String):void
    {
    }

    public function clear():void
    {
        Parameters._hk = true;
    }

    public function reportIntStat(_arg1:String, _arg2:int):void
    {
    }

    public function newAccountText():_9j
    {
        return (null);
    }

    public function newAccountManagement():Sprite
    {
        return (null);
    }

    public function showInGameRegister(_arg1:Stage):void
    {
    }

    public function cacheOffers():void
    {
    }

    public function showMoneyManagement(_arg1:Stage):void
    {
    }

    public function gameNetworkUserId():String
    {
        return ("");
    }

    public function gameNetwork():String
    {
        return (null);
    }

    public function playPlatform():String
    {
        return (null);
    }

    public function entrytag():String
    {
        return (null);
    }

    protected function internalLoad(_arg1:Stage, _arg2:Function):void
    {
    }


}
}