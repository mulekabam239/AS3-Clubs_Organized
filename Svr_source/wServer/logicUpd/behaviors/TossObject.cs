﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.realm;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.logic.behaviors
{
    class TossObject : Behavior
    {
        //State storage: cooldown timer

        double range;
        double? angle;
        ushort child;
        Cooldown coolDown;
        int coolDownOffset;

        public TossObject(string child, double range = 5, double? angle = null,
            Cooldown coolDown = new Cooldown(), int coolDownOffset = 0)
        {
            this.child = BehaviorDb.InitGameData.IdToObjectType[child];
            this.range = range;
            this.angle = angle * Math.PI / 180;
            this.coolDown = coolDown.Normalize();
            this.coolDownOffset = coolDownOffset;
        }

        protected override void OnStateEntry(Entity host, RealmTime time, ref object state)
        {
            state = coolDownOffset;
        }

        protected override void TickCore(Entity host, RealmTime time, ref object state)
        {
            int cool = (int)state;

            if (cool <= 0)
            {
                if (host.HasConditionEffect(ConditionEffects.Stunned)) return;

                Position target = new Position()
                    {
                        X = host.X + (float)(range * Math.Cos(angle.Value)),
                        Y = host.Y + (float)(range * Math.Sin(angle.Value)),
                    };
                host.Owner.BroadcastPacket(new ShowEffectPacket()
                {
                    EffectType = EffectType.Throw,
                    Color = new ARGB(0xffffbf00),
                    TargetId = host.Id,
                    PosA = target
                }, null);
                host.Owner.Timers.Add(new WorldTimer(1500, (world, t) =>
                {
                    Entity entity = Entity.Resolve(world.Manager, child);
                    entity.Move(target.X, target.Y);
                    (entity as Enemy).Terrain = (host as Enemy).Terrain;
                    world.EnterWorld(entity);
                }));
                cool = coolDown.Next(Random);
            }
            else
                cool -= time.thisTickTimes;

            state = cool;
        }
    }
}
