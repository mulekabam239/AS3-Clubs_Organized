﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using db;
using System.Collections.Specialized;
using System.IO;
using System.Web;
using System.Text.RegularExpressions;
using System.Xml.Serialization;
using System.Xml;

namespace server.account
{
    class setName : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            NameValueCollection query;
            using (StreamReader rdr = new StreamReader(context.Request.InputStream))
                query = HttpUtility.ParseQueryString(rdr.ReadToEnd());

            using (var db = new Database())
            {
                var acc = db.Verify(query["guid"], query["password"]);
                byte[] status;
                if (acc == null)
                {
                    status = Encoding.UTF8.GetBytes("<Error>Bad login</Error>");
                }
                else
                {
                    var cmd = db.CreateQuery();
                    object exescala;
                    cmd.CommandText = "SELECT COUNT(name) FROM accounts WHERE name=@name;";
                    cmd.Parameters.AddWithValue("@name", query["name"]);
                    exescala = cmd.ExecuteScalar();
                    if (int.Parse(exescala.ToString()) > 0)
                        status = Encoding.UTF8.GetBytes("<Error>Duplicated name</Error>");
                    else
                    {
                        cmd = db.CreateQuery();
                        cmd.CommandText = "UPDATE accounts SET name=@name, namechosen=TRUE WHERE id=@accId;";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        cmd.Parameters.AddWithValue("@name", query["name"]);
                        if (cmd.ExecuteNonQuery() != 0)
                            status = Encoding.UTF8.GetBytes("<Success />");
                        else
                            status = Encoding.UTF8.GetBytes("<Error>Internal error</Error>");
                    }
                }
                context.Response.OutputStream.Write(status, 0, status.Length);
            }
        }
    }
}
