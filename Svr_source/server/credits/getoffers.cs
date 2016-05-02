﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;

namespace server.credits
{
    class getoffers : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            var res = Encoding.UTF8.GetBytes(
"<Offers><Tok>WUT</Tok><Exp>STH</Exp><Offer><Id>0</Id><Price>0</Price><RealmGold>No Gold</RealmGold><CheckoutJWT>No Gold</CheckoutJWT><Data>YO</Data><Currency>HKD</Currency></Offer></Offers>");
            context.Response.OutputStream.Write(res, 0, res.Length);
        }
    }
}