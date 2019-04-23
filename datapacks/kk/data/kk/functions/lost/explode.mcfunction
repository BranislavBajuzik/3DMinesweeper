execute at @p[x_rotation=-90..0] positioned ~ ~-1 ~ run summon creeper ~ ~ ~ {ActiveEffects:[{Duration:2,Amplifier:0,Id:14,ShowParticles:0b}],Fuse:0}
execute at @p[x_rotation=0..90] positioned ~ ~3 ~ run summon creeper ~ ~ ~ {ActiveEffects:[{Duration:2,Amplifier:0,Id:14,ShowParticles:0b}],Fuse:0}
execute at @p run particle large_smoke ~-1 ~-1 ~-1 3 3 3 0 500 force
