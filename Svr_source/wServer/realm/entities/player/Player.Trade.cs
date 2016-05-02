using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.cliPackets;
using wServer.svrPackets;
using System.Collections.Concurrent;

namespace wServer.realm.entities
{
    partial class Player
    {
        Dictionary<Player, int> potentialTrader = new Dictionary<Player, int>();
        Player tradeTarget;
        bool[] trade;
        bool tradeAccepted;
        private int Item1;
        private int Item2;
        public static string itemList1 { get; set; }
        public static string itemList2 { get; set; }

        public void RequestTrade(RealmTime time, RequestTradePacket pkt)
        {
            if (!NameChosen)
            {
                SendInfo("Unique name is required to trade with others!");
                return;
            }
            if (tradeTarget != null)
            {
                SendError("You're already trading!");
                tradeTarget = null;
                return;
            }
            Player target = Owner.GetUniqueNamedPlayer(pkt.Name);
            if (target == null)
            {
                SendError("Player not found!");
                return;
            }
            if (target.tradeTarget != null && target.tradeTarget != this)
            {
                SendError(target.Name + " is already trading!");
                return;
            }

            if (this.potentialTrader.ContainsKey(target))
            {
                this.tradeTarget = target;
                this.trade = new bool[12];
                this.tradeAccepted = false;
                target.tradeTarget = this;
                target.trade = new bool[12];
                target.tradeAccepted = false;
                this.potentialTrader.Clear();
                target.potentialTrader.Clear();

                TradeItem[] my = new TradeItem[Inventory.Length];
                for (int i = 0; i < Inventory.Length; i++)
                    my[i] = new TradeItem()
                    {
                        Item = this.Inventory[i] == null ? -1 : Inventory[i].ObjectType,
                        SlotType = this.SlotTypes[i],
                        Included = false,
                        Tradeable = (Inventory[i] == null || i < 4) ? false : (!Inventory[i].Soulbound && !Inventory[i].Undead && !Inventory[i].SUndead)
                    };
                TradeItem[] your = new TradeItem[target.Inventory.Length];
                for (int i = 0; i < target.Inventory.Length; i++)
                    your[i] = new TradeItem()
                    {
                        Item = target.Inventory[i] == null ? -1 : target.Inventory[i].ObjectType,
                        SlotType = target.SlotTypes[i],
                        Included = false,
                        Tradeable = (target.Inventory[i] == null || i < 4) ? false : (!target.Inventory[i].Soulbound && !target.Inventory[i].Undead && !target.Inventory[i].SUndead)
                    };

                psr.SendPacket(new TradeStartPacket()
                {
                    MyItems = my,
                    YourName = target.Name,
                    YourItems = your
                });
                target.psr.SendPacket(new TradeStartPacket()
                {
                    MyItems = your,
                    YourName = this.Name,
                    YourItems = my
                });
            }
            else
            {
                target.potentialTrader[this] = 1000 * 20;
                target.psr.SendPacket(new TradeRequestedPacket()
                {
                    Name = Name
                });
                SendInfo("Sent trade request to " + target.Name);
                return;
            }
        }
        public void ChangeTrade(RealmTime time, ChangeTradePacket pkt)
        {
            if (this.trade != pkt.Offers)
            {
                this.tradeAccepted = false;
                tradeTarget.tradeAccepted = false;
                this.trade = pkt.Offers;

                tradeTarget.psr.SendPacket(new TradeChangedPacket()
                {
                    Offers = this.trade
                });
            }
        }
        public void AcceptTrade(RealmTime time, AcceptTradePacket pkt)
        {
            this.trade = pkt.MyOffers;
            if (tradeTarget.trade.SequenceEqual(pkt.YourOffers))
            {
                tradeTarget.trade = pkt.YourOffers;
                this.tradeAccepted = true;
                tradeTarget.psr.SendPacket(new TradeAcceptedPacket()
                {
                    MyOffers = tradeTarget.trade,
                    YourOffers = this.trade
                });
                Console.Out.WriteLine("Player {0} accepted trade with {1}", nName, tradeTarget.nName);

                /*if (this.tradeAccepted && tradeTarget.tradeAccepted)
                {
                    DoTrade();
                    Console.Out.WriteLine("Did trade!");
                }*/
            }
        }
        public void CancelTrade(RealmTime time, CancelTradePacket pkt)
        {
            this.psr.SendPacket(new TradeDonePacket()
            {
                Result = 1,
                Message = "Trade cancelled."
            });
            tradeTarget.psr.SendPacket(new TradeDonePacket()
            {
                Result = 1,
                Message = "Trade cancelled."
            });

            tradeTarget.tradeTarget = null;
            tradeTarget.trade = null;
            tradeTarget.tradeAccepted = false;
            this.tradeTarget = null;
            this.trade = null;
            this.tradeAccepted = false;
            return;
        }
        void TradeTick(RealmTime time)
        {
            if (trade != null)
                if (tradeTarget != null)
                    if (tradeAccepted && tradeTarget.tradeAccepted)
                        DoTrade();
            CheckTradeTimeout(time);
        }
        void CheckTradeTimeout(RealmTime time)
        {
            List<Tuple<Player, int>> newState = new List<Tuple<Player, int>>();
            foreach (var i in potentialTrader)
                newState.Add(new Tuple<Player, int>(i.Key, i.Value - time.thisTickTimes));

            foreach (var i in newState)
            {
                if (i.Item2 < 0)
                {
                    {
                        i.Item1.SendError("Trade to " + Name + " has timed out!");
                    }
                    potentialTrader.Remove(i.Item1);
                }
                else potentialTrader[i.Item1] = i.Item2;
            }
        }

        private void DoTrade()
        {
            string msg = "Trade Successful!";
            string failmsg = "An error occured while trading!";
            var thisItems = new List<Item>();
            var targetItems = new List<Item>();

            // make sure trade targets are valid
            if (tradeTarget == null || Owner == null || tradeTarget.Owner == null || Owner != tradeTarget.Owner)
            {
                if (this != null)
                    psr.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = failmsg
                    });

                if (tradeTarget != null)
                    tradeTarget.psr.SendPacket(new TradeDonePacket
                    {
                        Result = 1,
                        Message = failmsg
                    });

                //TODO - logThis
                return;
            }

            // get trade items
            for (int i = 4; i < Inventory.Length; i++)
            {
                if (trade[i] && !Inventory[i].Soulbound)
                {
                    thisItems.Add(Inventory[i]);
                    Inventory[i] = null;
                    UpdateCount++;

                    // save this trade info
                    if (Item1 == 0)
                    {
                        itemList1 = itemList1 + " " + thisItems[Item1].ObjectId;
                    }
                    else if (Item1 > 0)
                    {
                        itemList1 = itemList1 + ", " + thisItems[Item1].ObjectId;
                    }
                    Item1++;
                }


                if (tradeTarget.trade[i] && !tradeTarget.Inventory[i].Soulbound)
                {
                    targetItems.Add(tradeTarget.Inventory[i]);
                    tradeTarget.Inventory[i] = null;
                    tradeTarget.UpdateCount++;

                    // save target trade info
                    if (Item2 == 0)
                    {
                        itemList2 = itemList2 + " " + targetItems[Item2].ObjectId;
                    }
                    else if (Item2 > 0)
                    {
                        itemList2 = itemList2 + ", " + targetItems[Item2].ObjectId;
                    }
                    Item2++;
                }
            }

            // move thisItems -> tradeTarget
            for (int j = thisItems.Count - 1; j >= 0; j--)
                for (int i = 0; i < tradeTarget.Inventory.Length; i++)
                {
                    if ((tradeTarget.SlotTypes[i] == 0 &&
                    tradeTarget.Inventory[i] == null) ||
                    (thisItems[j] != null &&
                    tradeTarget.SlotTypes[i] == thisItems[j].SlotType &&
                    tradeTarget.Inventory[i] == null))
                    {
                        tradeTarget.Inventory[i] = thisItems[j];
                        thisItems.RemoveAt(j);
                        break;
                    }
                }

            // move tradeItems -> this
            for (int j = targetItems.Count - 1; j >= 0; j--)
                for (int i = 0; i < Inventory.Length; i++)
                {
                    if ((SlotTypes[i] == 0 &&
                    Inventory[i] == null) ||
                    (targetItems[j] != null &&
                    SlotTypes[i] == targetItems[j].SlotType &&
                    Inventory[i] == null))
                    {
                        Inventory[i] = targetItems[j];
                        targetItems.RemoveAt(j);
                        break;
                    }
                }

            // check for lingering items
            if (thisItems.Count > 0 ||
            targetItems.Count > 0)
            {
                msg = "An error occured while trading!";
            }

            // trade successful, notify and save
            psr.SendPacket(new TradeDonePacket
            {
                Result = 1,
                Message = msg
            });
            tradeTarget.psr.SendPacket(new TradeDonePacket
            {
                Result = 1,
                Message = msg
            });
            SaveToCharacter();
            psr.Save();
            tradeTarget.SaveToCharacter();
            tradeTarget.psr.Save();

            // clean up
            itemList1 = "";
            itemList2 = "";
            Item1 = 0;
            Item2 = 0;
            UpdateCount++;
            tradeTarget.UpdateCount++;
            tradeTarget.tradeTarget = null;
            tradeTarget.trade = null;
            tradeTarget.tradeAccepted = false;
            tradeTarget = null;
            trade = null;
            tradeAccepted = false;
        }
    }
}