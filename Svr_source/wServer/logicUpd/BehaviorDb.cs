﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.realm;
using wServer.realm.entities;
using wServer.logic.loot;
using System.Threading;
using System.Reflection;
using log4net;

namespace wServer.logic
{
    public partial class BehaviorDb
    {
        static ILog log = LogManager.GetLogger(typeof(BehaviorDb));

        public RealmManager Manager { get; private set; }

        static int initializing;
        internal static BehaviorDb InitDb;
        internal static XmlData InitGameData { get { return InitDb.Manager.GameData; } }

        public BehaviorDb(RealmManager manager)
        {
            log.Info("Initializing Behavior Database...");

            this.Manager = manager;

            Definitions = new Dictionary<ushort, Tuple<State, Loot>>();

            if (Interlocked.Exchange(ref initializing, 1) == 1)
            {
                log.Error("Attempted to initialize multiple BehaviorDb at the same time.");
                throw new InvalidOperationException("Attempted to initialize multiple BehaviorDb at the same time.");
            }
            InitDb = this;

            var fields = GetType()
                .GetFields(BindingFlags.NonPublic | BindingFlags.Instance)
                .Where(field => field.FieldType == typeof(_))
                .ToArray();
            for (int i = 0; i < fields.Length; i++)
            {
                var field = fields[i];
                log.InfoFormat("Loading behavior for '{0}'({1}/{2})...", field.Name, i + 1, fields.Length);
                ((_)field.GetValue(this))();
                field.SetValue(this, null);
            }

            InitDb = null;
            initializing = 0;

            log.Info("Behavior Database initialized...");
        }

        public void ResolveBehavior(Entity entity)
        {
            Tuple<State, Loot> def;
            if (Definitions.TryGetValue(entity.ObjectType, out def))
                entity.SwitchTo(def.Item1);
        }

        delegate ctor _();
        struct ctor
        {
            public ctor Init(string objType, State rootState, params ILootDef[] defs)
            {
                var d = new Dictionary<string, State>();
                rootState.Resolve(d);
                rootState.ResolveChildren(d);
                var dat = InitDb.Manager.GameData;
                if (defs.Length > 0)
                {
                    var loot = new Loot(defs);
                    rootState.Death += (sender, e) => loot.Handle((Enemy)e.Host, e.Time);
                    InitDb.Definitions.Add(dat.IdToObjectType[objType], new Tuple<State, Loot>(rootState, loot));
                }
                else
                    InitDb.Definitions.Add(dat.IdToObjectType[objType], new Tuple<State, Loot>(rootState, null));
                return this;
            }
        }
        static ctor Behav()
        {
            return new ctor();
        }

        public Dictionary<ushort, Tuple<State, Loot>> Definitions { get; private set; }

    }
}
