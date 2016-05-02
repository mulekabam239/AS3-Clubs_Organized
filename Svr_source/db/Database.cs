﻿using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using Ionic.Zlib;
using System.Xml.Linq;

namespace db
{
    public partial class Database : IDisposable
    {
        MySqlConnection con;
        public Database()
        {
            ////////////////
            //    NOTE    //
            ////////////////
            // You might be using a database from source released by botmaker.
            // (In fact, you probably are.)
            // If so, replace the "password=" with "password=botmaker", unless you chose a different DB password.
            con = new MySqlConnection("Server=127.0.0.1;Database=rotmg;uid=root;password=YOURDBPASSWORD");
            //as3clubosaurusplsthanxu-skelly
            con.Open();
        }

        public void Dispose()
        {
            con.Close();
        }

        public MySqlCommand CreateQuery()
        {
            return con.CreateCommand();
        }

        public static int DateTimeToUnixTimestamp(DateTime dateTime)
        {
            return (int)(dateTime - new DateTime(1970, 1, 1).ToLocalTime()).TotalSeconds;
        }

        public List<NewsItem> GetNews(Account acc)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT icon, title, text, link, date FROM news ORDER BY date LIMIT 10;";
            List<NewsItem> ret = new List<NewsItem>();
            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                    ret.Add(new NewsItem()
                    {
                        Icon = rdr.GetString("icon"),
                        Title = rdr.GetString("title"),
                        TagLine = rdr.GetString("text"),
                        Link = rdr.GetString("link"),
                        Date = DateTimeToUnixTimestamp(rdr.GetDateTime("date")),
                    });
            }
            if (acc != null)
            {
                cmd.CommandText = @"SELECT charId, characters.charType, level, death.totalFame, time
FROM characters, death
WHERE dead = TRUE AND
characters.accId=@accId AND death.accId=@accId
AND characters.charId=death.chrId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                using (var rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                        ret.Add(new NewsItem()
                        {
                            Icon = "fame",
                            Title = string.Format("Your {0} died at level {1}",
                                XmlDatas.TypeToId[(short)rdr.GetInt32("charType")],
                                rdr.GetInt32("level")),
                            TagLine = string.Format("You earned {0} glorious Fame",
                                rdr.GetInt32("totalFame")),
                            Link = "fame:" + rdr.GetInt32("charId"),
                            Date = DateTimeToUnixTimestamp(rdr.GetDateTime("time")),
                        });
                }
            }
            ret.Sort((a, b) => -Comparer<int>.Default.Compare(a.Date, b.Date));
            return ret.Take(10).ToList();
        }
        static string[] names = new string[] { 
            "Darq", "Deyst", "Drac", "Drol",
            "Eango", "Eashy", "Eati", "Eendi", "Ehoni",
            "Gharr", "Iatho", "Iawa", "Idrae", "Iri", "Issz", "Itani",
            "Laen", "Lauk", "Lorz",
            "Oalei", "Odaru", "Oeti", "Orothi", "Oshyu",
            "Queq", "Radph", "Rayr", "Ril", "Rilr", "Risrr",
            "Saylt", "Scheev", "Sek", "Serl", "Seus",
            "Tal", "Tiar", "Uoro", "Urake", "Utanu",
            "Vorck", "Vorv", "Yangu", "Yimi", "Zhiar"
        };
        public static Account CreateGuestAccount(string uuid)
        {
            return new Account()
            {
                Name = names[(uint)uuid.GetHashCode() % names.Length],
                AccountId = 0,
                Admin = false,
                Banned = false,
                Rank = 0,
                BeginnerPackageTimeLeft = 0,
                Converted = false,
                Credits = 0,
                Guild = null,
                NameChosen = false,
                NextCharSlotPrice = 0,
                VerifiedEmail = false,
                Stats = new Stats()
                {
                    BestCharFame = 0,
                    ClassStates = new List<ClassStats>(),
                    Fame = 0,
                    TotalFame = 0
                },
                Vault = new VaultData()
                {
                    Chests = new List<VaultChest>()
                }
            };
        }

        public Account Verify(string uuid, string password)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT id, name, rank, namechosen, verified, guild, guildRank, banned, locked, ignored FROM accounts WHERE uuid=@uuid AND password=SHA1(@password);";
            cmd.Parameters.AddWithValue("@uuid", uuid);
            cmd.Parameters.AddWithValue("@password", password);
            Account ret;
            using (var rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) return null;
                rdr.Read();
                ret = new Account()
                {
                    Name = rdr.GetString("name"),
                    AccountId = rdr.GetInt32("id"),
                    Admin = rdr.GetInt32("rank") >= 2,
                    Rank = rdr.GetInt32("rank"),
                    Banned = rdr.GetBoolean("banned"),
                    BeginnerPackageTimeLeft = 0,
                    Converted = false,
                    Guild = new Guild()
                    {
                        Id = rdr.GetInt32("guild"),
                        Rank = rdr.GetInt32("guildRank")
                    },
                    NameChosen = rdr.GetBoolean("namechosen"),
                    NextCharSlotPrice = 0,
                    VerifiedEmail = true,//rdr.GetBoolean("verified")
                    Locked = Utils.StringListToIntList(rdr.GetString("locked").Split(',').ToList()),
                    Ignored = Utils.StringListToIntList(rdr.GetString("ignored").Split(',').ToList()),
                };
            }
            ReadStats(ret);
            ret.Guild.Name = GetGuildName(ret.Guild.Id);
            return ret;
        }
        public Account Register(string uuid, string password, bool isGuest)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT COUNT(id) FROM accounts WHERE uuid=@uuid;";
            cmd.Parameters.AddWithValue("@uuid", uuid);
            if ((int)(long)cmd.ExecuteScalar() > 0) return null;

            cmd = CreateQuery();
            cmd.CommandText = "INSERT INTO accounts(uuid, password, name, rank, namechosen, verified, guild, guildRank, vaultCount, maxCharSlot, regTime, guest, banned, locked, ignored) VALUES(@uuid, SHA1(@password), @name, 0, 1, 0, 0, 0, 1, 1, @regTime, @guest, 0, @empty, @empty);";
            cmd.Parameters.AddWithValue("@uuid", uuid);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@name", uuid);//names[(uint)uuid.GetHashCode() % names.Length]);
            cmd.Parameters.AddWithValue("@guest", isGuest);
            cmd.Parameters.AddWithValue("@regTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@empty", "");
            int v = cmd.ExecuteNonQuery();
            bool ret = v > 0;

            if (ret)
            {
                cmd = CreateQuery();
                cmd.CommandText = "SELECT last_insert_id();";
                int accId = Convert.ToInt32(cmd.ExecuteScalar());

                cmd = CreateQuery();
                cmd.CommandText = "INSERT INTO stats(accId, fame, totalFame, credits, totalCredits) VALUES(@accId, 100, 100, 0, 0);";
                cmd.Parameters.AddWithValue("@accId", accId);
                cmd.ExecuteNonQuery();

                cmd = CreateQuery();
                cmd.CommandText = "INSERT INTO vaults(accId, items) VALUES(@accId, '-1, -1, -1, -1, -1, -1, -1, -1');";
                cmd.Parameters.AddWithValue("@accId", accId);
                cmd.ExecuteNonQuery();
            }
            return Verify(uuid, password);
        }

        public bool HasUuid(string uuid)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT COUNT(id) FROM accounts WHERE uuid=@uuid;";
            cmd.Parameters.AddWithValue("@uuid", uuid);
            return (int)(long)cmd.ExecuteScalar() > 0;
        }
        public Account GetAccount(int id)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT id, name, rank, namechosen, verified, guild, guildRank, banned, locked, ignored FROM accounts WHERE id=@id;";
            cmd.Parameters.AddWithValue("@id", id);
            Account ret;
            using (var rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) return null;
                rdr.Read();
                ret = new Account()
                {
                    Name = rdr.GetString("name"),
                    AccountId = rdr.GetInt32("id"),
                    Admin = rdr.GetInt32("rank") >= 2,
                    Rank = rdr.GetInt32("rank"),
                    Banned = rdr.GetBoolean("banned"),
                    BeginnerPackageTimeLeft = 0,
                    Converted = false,
                    Guild = new Guild()
                    {
                        Id = rdr.GetInt32("guild"),
                        Rank = rdr.GetInt32("guildRank")
                    },
                    NameChosen = rdr.GetBoolean("namechosen"),
                    NextCharSlotPrice = 0,
                    VerifiedEmail = rdr.GetBoolean("verified"),
                    Locked = Utils.StringListToIntList(rdr.GetString("locked").Split(',').ToList()),
                    Ignored = Utils.StringListToIntList(rdr.GetString("ignored").Split(',').ToList()),
                };
            }
            ReadStats(ret);
            ret.Guild.Name = GetGuildName(ret.Guild.Id);
            return ret;
        }
        public Account GetAccount(string name)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT id, name, rank, namechosen, verified, guild, guildRank, banned, locked, ignored FROM accounts WHERE name=@name;";
            cmd.Parameters.AddWithValue("@name", name);
            Account ret;
            using (var rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) return null;
                rdr.Read();
                ret = new Account()
                {
                    Name = rdr.GetString("name"),
                    AccountId = rdr.GetInt32("id"),
                    Admin = rdr.GetInt32("rank") >= 2,
                    Rank = rdr.GetInt32("rank"),
                    BeginnerPackageTimeLeft = 0,
                    Converted = false,
                    Guild = new Guild()
                    {
                        Id = rdr.GetInt32("guild"),
                        Rank = rdr.GetInt32("guildRank")
                    },
                    NameChosen = rdr.GetBoolean("namechosen"),
                    NextCharSlotPrice = 0,
                    VerifiedEmail = rdr.GetBoolean("verified"),
                    Locked = Utils.StringListToIntList(rdr.GetString("locked").Split(',').ToList()),
                    Ignored = Utils.StringListToIntList(rdr.GetString("ignored").Split(',').ToList()),
                };
            }
            ReadStats(ret);
            ret.Guild.Name = GetGuildName(ret.Guild.Id);
            return ret;
        }

        public int UpdateCredit(Account acc, int amount)
        {
            var cmd = CreateQuery();
            if (amount > 0)
            {
                cmd.CommandText = "UPDATE stats SET totalCredits = totalCredits + @amount WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.ExecuteNonQuery();
                cmd = CreateQuery();
            }
            cmd.CommandText = @"UPDATE stats SET credits = credits + (@amount) WHERE accId=@accId;
SELECT credits FROM stats WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@amount", amount);
            return (int)cmd.ExecuteScalar();
        }
        public int UpdateFame(Account acc, int amount)
        {
            var cmd = CreateQuery();
            if (amount > 0)
            {
                cmd.CommandText = "UPDATE stats SET totalFame = totalFame + @amount WHERE accId=@accId;";
                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                cmd.Parameters.AddWithValue("@amount", amount);
                cmd.ExecuteNonQuery();
                cmd = CreateQuery();
            }
            cmd.CommandText = @"UPDATE stats SET fame = fame + (@amount) WHERE accId=@accId;
SELECT fame FROM stats WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@amount", amount);
            return (int)cmd.ExecuteScalar();
        }

        public void ReadStats(Account acc)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT fame, totalFame, credits FROM stats WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            using (var rdr = cmd.ExecuteReader())
            {
                if (rdr.HasRows)
                {
                    rdr.Read();
                    acc.Credits = rdr.GetInt32("credits");
                    acc.Stats = new Stats()
                    {
                        Fame = rdr.GetInt32("fame"),
                        TotalFame = rdr.GetInt32("totalFame")
                    };
                }
                else
                {
                    acc.Credits = 0;
                    acc.Stats = new Stats()
                    {
                        Fame = 0,
                        TotalFame = 0,
                        BestCharFame = 0,
                        ClassStates = new List<ClassStats>()
                    };
                }
            }

            acc.Stats.ClassStates = ReadClassStates(acc);
            if (acc.Stats.ClassStates.Count > 0)
                acc.Stats.BestCharFame = acc.Stats.ClassStates.Max(_ => _.BestFame);
            acc.Vault = ReadVault(acc);
        }

        public List<ClassStats> ReadClassStates(Account acc)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT objType, bestLv, bestFame FROM classstats WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            List<ClassStats> ret = new List<ClassStats>();
            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                    ret.Add(new ClassStats()
                    {
                        ObjectType = rdr.GetInt32("objType"),
                        BestFame = rdr.GetInt32("bestFame"),
                        BestLevel = rdr.GetInt32("bestLv")
                    });
            }
            return ret;
        }

        public VaultData ReadVault(Account acc)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT chestId, items FROM vaults WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            using (var rdr = cmd.ExecuteReader())
            {
                if (rdr.HasRows)
                {
                    VaultData ret = new VaultData() { Chests = new List<VaultChest>() };
                    while (rdr.Read())
                    {
                        ret.Chests.Add(new VaultChest()
                        {
                            ChestId = rdr.GetInt32("chestId"),
                            _Items = rdr.GetString("items")
                        });
                    }
                    return ret;
                }
                else
                {
                    return new VaultData()
                    {
                        Chests = new List<VaultChest>()
                    };
                }
            }
        }
        public void SaveChest(Account acc, VaultChest chest)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "UPDATE vaults SET items=@items WHERE accId=@accId AND chestId=@chestId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@chestId", chest.ChestId);
            cmd.Parameters.AddWithValue("@items", chest._Items);
            cmd.ExecuteNonQuery();
        }
        public VaultChest CreateChest(Account acc)
        {
            var cmd = CreateQuery();
            cmd.CommandText = @"INSERT INTO vaults(accId, items) VALUES(@accId, '-1, -1, -1, -1, -1, -1, -1, -1');
SELECT MAX(chestId) FROM vaults WHERE accId = @accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            return new VaultChest()
            {
                ChestId = (int)cmd.ExecuteScalar(),
                _Items = "-1, -1, -1, -1, -1, -1, -1, -1"
            };
        }

        public void GetCharData(Account acc, Chars chrs)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT IFNULL(MAX(id), 0) + 1 FROM characters WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            chrs.NextCharId = (int)(long)cmd.ExecuteScalar();

            cmd = CreateQuery();
            cmd.CommandText = "SELECT maxCharSlot FROM accounts WHERE id=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            chrs.MaxNumChars = (int)cmd.ExecuteScalar();
        }

        public int GetNextCharID(Account acc)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT IFNULL(MAX(id), 0) + 1 FROM characters WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            var ret = (int)(long)cmd.ExecuteScalar();
            return ret;
        }

        public void LoadCharacters(Account acc, Chars chrs)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT * FROM characters WHERE accId=@accId AND dead = FALSE;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    int[] stats = Utils.FromCommaSepString32(rdr.GetString("stats"));
                    chrs.Characters.Add(new Char()
                    {
                        ObjectType = (short)rdr.GetInt32("charType"),
                        CharacterId = rdr.GetInt32("charId"),
                        Level = rdr.GetInt32("level"),
                        Exp = rdr.GetInt32("exp"),
                        CurrentFame = rdr.GetInt32("fame"),
                        _Equipment = rdr.GetString("items"),
                        MaxHitPoints = stats[0],
                        HitPoints = rdr.GetInt32("hp"),
                        MaxMagicPoints = stats[1],
                        MagicPoints = rdr.GetInt32("mp"),
                        Attack = stats[2],
                        Defense = stats[3],
                        Speed = stats[4],
                        Dexterity = stats[5],
                        HpRegen = stats[6],
                        MpRegen = stats[7],
                        Tex1 = rdr.GetInt32("tex1"),
                        Tex2 = rdr.GetInt32("tex2"),
                        Dead = false,
                        PCStats = rdr.GetString("fameStats"),
                        Pet = rdr.GetInt32("pet"),
                    });
                }
            }
        }

        public static Char CreateCharacter(short type, int chrId)
        {
            XElement cls = XmlDatas.TypeToElement[type];
            if (cls == null) return null;
            return new Char()
            {
                ObjectType = type,
                CharacterId = chrId,
                Level = 1,
                Exp = 0,
                CurrentFame = 0,
                _Equipment = cls.Element("Equipment").Value,
                MaxHitPoints = int.Parse(cls.Element("MaxHitPoints").Value),
                HitPoints = int.Parse(cls.Element("MaxHitPoints").Value),
                MaxMagicPoints = int.Parse(cls.Element("MaxMagicPoints").Value),
                MagicPoints = int.Parse(cls.Element("MaxMagicPoints").Value),
                Attack = int.Parse(cls.Element("Attack").Value),
                Defense = int.Parse(cls.Element("Defense").Value),
                Speed = int.Parse(cls.Element("Speed").Value),
                Dexterity = int.Parse(cls.Element("Dexterity").Value),
                HpRegen = int.Parse(cls.Element("HpRegen").Value),
                MpRegen = int.Parse(cls.Element("MpRegen").Value),
                Tex1 = 0,
                Tex2 = 0,
                Dead = false,
                PCStats = "",
                FameStats = new FameStats(),
                Pet = -1
            };
        }

        public Char LoadCharacter(Account acc, int charId)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT * FROM characters WHERE accId=@accId AND charId=@charId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@charId", charId);
            using (var rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) return null;
                rdr.Read();
                int[] stats = Utils.FromCommaSepString32(rdr.GetString("stats"));
                var ret = new Char()
                {
                    ObjectType = (short)rdr.GetInt32("charType"),
                    CharacterId = rdr.GetInt32("charId"),
                    Level = rdr.GetInt32("level"),
                    Exp = rdr.GetInt32("exp"),
                    CurrentFame = rdr.GetInt32("fame"),
                    _Equipment = rdr.GetString("items"),
                    MaxHitPoints = stats[0],
                    HitPoints = rdr.GetInt32("hp"),
                    MaxMagicPoints = stats[1],
                    MagicPoints = rdr.GetInt32("mp"),
                    Attack = stats[2],
                    Defense = stats[3],
                    Speed = stats[4],
                    HpRegen = stats[5],
                    MpRegen = stats[6],
                    Dexterity = stats[7],
                    Tex1 = rdr.GetInt32("tex1"),
                    Tex2 = rdr.GetInt32("tex2"),
                    Dead = rdr.GetBoolean("dead"),
                    Pet = rdr.GetInt32("pet"),
                    PCStats = rdr.GetString("fameStats")
                };
                ret.FameStats = new FameStats();
                //:)
                return ret;
            }
        }

        public void SaveCharacter(Account acc, Char chr)
        {
            var cmd = CreateQuery();
            cmd.CommandText = @"UPDATE characters SET 
level=@level, 
exp=@exp, 
fame=@fame, 
items=@items, 
stats=@stats, 
hp=@hp, 
mp=@mp, 
tex1=@tex1, 
tex2=@tex2, 
pet=@pet, 
fameStats=@fameStats 
WHERE accId=@accId AND charId=@charId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@charId", chr.CharacterId);

            cmd.Parameters.AddWithValue("@level", chr.Level);
            cmd.Parameters.AddWithValue("@exp", chr.Exp);
            cmd.Parameters.AddWithValue("@fame", chr.CurrentFame);
            cmd.Parameters.AddWithValue("@items", chr._Equipment);
            cmd.Parameters.AddWithValue("@stats", Utils.GetCommaSepString(new int[]
            {
                chr.MaxHitPoints,
                chr.MaxMagicPoints,
                chr.Attack,
                chr.Defense,
                chr.Speed,
                chr.HpRegen,
                chr.MpRegen,
                chr.Dexterity
            }));
            cmd.Parameters.AddWithValue("@hp", chr.HitPoints);
            cmd.Parameters.AddWithValue("@mp", chr.MagicPoints);
            cmd.Parameters.AddWithValue("@tex1", chr.Tex1);
            cmd.Parameters.AddWithValue("@tex2", chr.Tex2);
            cmd.Parameters.AddWithValue("@pet", chr.Pet);
            chr.PCStats = Convert.ToBase64String(ZlibStream.CompressBuffer(chr.FameStats.Write())).Replace('+', '-').Replace('/', '_');
            cmd.Parameters.AddWithValue("@fameStats", chr.PCStats);
            cmd.ExecuteNonQuery();

            cmd = CreateQuery();
            cmd.CommandText = @"INSERT INTO classstats(accId, objType, bestLv, bestFame) 
VALUES(@accId, @objType, @bestLv, @bestFame) 
ON DUPLICATE KEY UPDATE 
bestLv = GREATEST(bestLv, @bestLv), 
bestFame = GREATEST(bestFame, @bestFame);";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@objType", chr.ObjectType);
            cmd.Parameters.AddWithValue("@bestLv", chr.Level);
            cmd.Parameters.AddWithValue("@bestFame", chr.CurrentFame);
            cmd.ExecuteNonQuery();
        }

        public void Death(Account acc, Char chr, string killer)    //Save first
        {
            var cmd = CreateQuery();
            cmd.CommandText = @"UPDATE characters SET 
dead=TRUE, 
deathTime=NOW() 
WHERE accId=@accId AND charId=@charId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@charId", chr.CharacterId);
            cmd.ExecuteNonQuery();

            bool firstBorn;
            var finalFame = chr.FameStats.CalculateTotal(acc, chr, chr.CurrentFame, out firstBorn);

            cmd = CreateQuery();
            cmd.CommandText = @"UPDATE stats SET 
fame=fame+@amount, 
totalFame=totalFame+@amount 
WHERE accId=@accId;";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@amount", finalFame);
            cmd.ExecuteNonQuery();

            if (acc.Guild.Name != "")
            {
                cmd = CreateQuery();
                cmd.CommandText = @"UPDATE guilds SET
guildFame=guildFame+@amount,
totalGuildFame=totalGuildFame+@amount
WHERE name=@name;";
                cmd.Parameters.AddWithValue("@amount", finalFame);
                cmd.Parameters.AddWithValue("@name", acc.Guild.Name);
                cmd.ExecuteNonQuery();
            }

            cmd = CreateQuery();
            cmd.CommandText = @"INSERT INTO death(accId, chrId, name, charType, tex1, tex2, items, fame, fameStats, totalFame, firstBorn, killer) 
VALUES(@accId, @chrId, @name, @objType, @tex1, @tex2, @items, @fame, @fameStats, @totalFame, @firstBorn, @killer);";
            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
            cmd.Parameters.AddWithValue("@chrId", chr.CharacterId);
            cmd.Parameters.AddWithValue("@name", acc.Name);
            cmd.Parameters.AddWithValue("@objType", chr.ObjectType);
            cmd.Parameters.AddWithValue("@tex1", chr.Tex1);
            cmd.Parameters.AddWithValue("@tex2", chr.Tex2);
            cmd.Parameters.AddWithValue("@items", chr._Equipment);
            cmd.Parameters.AddWithValue("@fame", chr.CurrentFame);
            cmd.Parameters.AddWithValue("@fameStats", chr.PCStats);
            cmd.Parameters.AddWithValue("@totalFame", finalFame);
            cmd.Parameters.AddWithValue("@firstBorn", firstBorn);
            cmd.Parameters.AddWithValue("@killer", killer);
            cmd.ExecuteNonQuery();
        }

        public string GetCurrentVer()
        {
            var cmd = CreateQuery();

            cmd.CommandText = "SELECT cliVersion FROM clinews ORDER BY date DESC LIMIT 1";

            using (var rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) throw new Exception("No rows found!");
                rdr.Read();
                return rdr.GetString("cliVersion");
            }
        }

        public void DbAccountList(int listId, List<int> accIds)
        {
            var cmd = CreateQuery();


            if (listId == 0) {

            } else if (listId == 1) {

            }
        }

        public void AddToArenaLB(int wave, List<string> participants)
        {
            string players = string.Join(", ", participants.ToArray());
            var cmd = CreateQuery();
            cmd.CommandText = "INSERT INTO arenalb(wave, players) VALUES(@wave, @players)";
            cmd.Parameters.AddWithValue("@wave", wave);
            cmd.Parameters.AddWithValue("@players", players);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch { }
        }

        public string[] GetArenaLeaderboards()
        {
            List<string> lbrankings = new List<string>();

            var cmd = CreateQuery();

            cmd.CommandText = "SELECT * FROM arenalb ORDER BY wave DESC LIMIT 10";

            using (var rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) lbrankings.Add("None");
                else
                {
                    while (rdr.Read())
                    {
                        lbrankings.Add("Wave " + rdr.GetInt32("wave").ToString() + " - " + rdr.GetString("players"));
                    }
                }
            }

            return lbrankings.ToArray();
        }

        public string[] GetGuildLeaderboards()
        {
            List<string> guildrankings = new List<string>();

            var cmd = CreateQuery();

            cmd.CommandText = "SELECT * FROM guilds ORDER BY guildFame DESC LIMIT 10";

            using (var rdr = cmd.ExecuteReader())
            {
                if (!rdr.HasRows) guildrankings.Add("None");
                else
                {
                    while (rdr.Read())
                    {
                        guildrankings.Add(rdr.GetString("name") + " - " + rdr.GetInt32("guildFame").ToString() + " Fame");
                    }
                }
            }

            return guildrankings.ToArray();
        }


        public List<int> getLockeds(int accId)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT locked FROM accounts WHERE id=@accId";
            cmd.Parameters.AddWithValue("@accid", accId);
            try
            {
                List<int> locks = new List<int>();
                foreach (var i in cmd.ExecuteScalar().ToString().Split(','))
                    locks.Add(int.Parse(i));
                return locks;
            }
            catch
            { return new List<int>(); }
        }
        public List<int> getIgnoreds(int accId)
        {
            var cmd = CreateQuery();
            cmd.CommandText = "SELECT ignored FROM accounts WHERE id=@accId";
            cmd.Parameters.AddWithValue("@accid", accId);
            try
            {
                List<int> ignores = new List<int>();
                foreach (var i in cmd.ExecuteScalar().ToString().Split(','))
                    ignores.Add(int.Parse(i));
                return ignores;
            }
            catch
            { return new List<int>(); }
        }
        public bool AddLock(int accId, int lockId)
        {
            var x = getLockeds(accId); x.Add(lockId);
            var s = Utils.GetCommaSepString(x.ToArray());
            var cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET locked=@newlocked WHERE id=@accId";
            cmd.Parameters.AddWithValue("@newlocked", s);
            cmd.Parameters.AddWithValue("@accId", accId);
            if (cmd.ExecuteNonQuery() == 0)
                return false;
            return true;
        }
        public bool RemoveLock(int accId, int lockId)
        {
            var x = getLockeds(accId); x.Remove(lockId);
            var s = Utils.GetCommaSepString(x.ToArray());
            var cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET locked=@newlocked WHERE id=@accId";
            cmd.Parameters.AddWithValue("@newlocked", s);
            cmd.Parameters.AddWithValue("@accId", accId);
            if (cmd.ExecuteNonQuery() == 0)
                return false;
            return true;
        }
        public bool AddIgnore(int accId, int ignoreId)
        {
            var x = getIgnoreds(accId); x.Add(ignoreId);
            var s = Utils.GetCommaSepString(x.ToArray());
            var cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET ignored=@newignored WHERE id=@accId";
            cmd.Parameters.AddWithValue("@newignored", s);
            cmd.Parameters.AddWithValue("@accId", accId);
            if (cmd.ExecuteNonQuery() == 0)
                return false;
            return true;
        }
        public bool RemoveIgnore(int accId, int ignoreId)
        {
            var x = getIgnoreds(accId); x.Remove(ignoreId);
            var s = Utils.GetCommaSepString(x.ToArray());
            var cmd = CreateQuery();
            cmd.CommandText = "UPDATE accounts SET ignored=@newignored WHERE id=@accId";
            cmd.Parameters.AddWithValue("@newignored", s);
            cmd.Parameters.AddWithValue("@accId", accId);
            if (cmd.ExecuteNonQuery() == 0)
                return false;
            return true;
        }
    }
}