// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//source._092.not

package source._092{
    import source._qj._pn;
    import source._g3.equalTo;

    public function not(_arg1:Object):_pn{
        if ((_arg1 is _pn))
        {
            return (new _L_((_arg1 as _pn)));
        };
        return (not(equalTo(_arg1)));
    }
}//package source._092

