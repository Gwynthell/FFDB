-----------------------------------
-- Area: Kazham
-- NPC: Roropp
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");

require("scripts/globals/pathfind");

local path = {
16.031977, -8.000000, -106.132980,
16.257568, -8.000000, -105.056381,
16.488544, -8.000000, -103.993233,
16.736769, -8.000000, -102.925789,
16.683693, -8.000000, -103.979767,
16.548674, -8.000000, -105.063362,
16.395681, -8.000000, -106.140511,
16.232897, -8.000000, -107.264717,
15.467215, -8.000000, -111.498398,
14.589552, -8.000000, -110.994324,
15.159187, -8.000000, -111.843941,
14.467873, -8.000000, -110.962730,
15.174071, -8.000000, -111.862633,
14.541949, -8.000000, -111.057007,
14.902087, -8.000000, -110.084839,
16.047390, -8.000000, -109.979256,
15.778022, -8.000000, -111.043304,
14.890110, -8.000000, -111.671753,
14.021555, -8.000000, -112.251015,
14.686207, -8.000000, -111.499725,
14.093862, -8.000000, -110.499420,
13.680259, -8.000000, -109.391823,
13.557489, -8.000000, -108.379669,
13.505498, -8.000000, -107.381012,
13.459559, -8.000000, -106.253922,
13.316416, -8.000000, -103.526192,
13.187886, -8.000000, -104.739197,
13.107801, -8.000000, -105.800117,
12.796517, -8.000000, -112.526253,
13.832601, -8.000000, -112.296143,
14.750398, -8.000000, -111.783379,
15.670343, -8.000000, -111.165863,
16.603874, -8.000000, -110.633209,
16.092684, -8.000000, -111.518547,
14.989306, -8.000000, -111.488846,
14.200422, -8.000000, -110.700859,
13.893030, -8.000000, -109.573753,
14.125311, -8.000000, -108.444000,
14.459513, -8.000000, -107.450630,
14.801712, -8.000000, -106.489639,
17.003086, -8.000000, -99.881256,
16.131863, -8.000000, -100.382454,
15.278582, -8.000000, -101.082420,
14.444073, -8.000000, -101.823395,
13.716499, -8.000000, -102.551468,
13.602413, -8.000000, -103.671387,
13.773719, -8.000000, -104.753410,
14.019071, -8.000000, -105.842079,
14.275101, -8.000000, -106.944748,
15.256051, -8.000000, -111.604820,
14.447664, -8.000000, -110.851128,
15.032362, -8.000000, -111.679832,
14.342421, -8.000000, -110.802597,
13.347830, -8.000000, -111.075569,
12.911378, -8.000000, -112.149437,
13.853123, -8.000000, -112.719269,
14.862821, -8.000000, -112.491272,
14.661202, -8.000000, -111.423317,
14.026034, -8.000000, -110.421486,
13.683197, -8.000000, -109.474442,
13.565609, -8.000000, -108.425598,
13.508922, -8.000000, -107.411247,
13.463074, -8.000000, -106.340248,
13.314778, -8.000000, -103.679779,
13.196125, -8.000000, -104.712784,
13.107168, -8.000000, -105.817261,
12.642462, -8.000000, -112.284569,
12.722448, -8.000000, -111.167519,
12.800394, -8.000000, -110.082321,
13.358773, -8.000000, -103.535522,
13.700077, -8.000000, -104.534401,
13.968060, -8.000000, -105.588699,
14.196942, -8.000000, -106.594994,
14.446990, -8.000000, -107.686691,
14.850841, -8.000000, -109.436707,
15.239276, -8.000000, -111.548279,
14.406080, -8.000000, -110.805321,
15.076430, -8.000000, -111.739746,
14.353576, -8.000000, -110.817177,
13.903994, -8.000000, -109.854828,
14.002557, -8.000000, -108.838097,
14.350549, -8.000000, -107.686317,
14.707720, -8.000000, -106.730751,
15.101375, -8.000000, -105.648056,
16.961918, -8.000000, -99.919090,
15.985752, -8.000000, -100.501892,
15.192271, -8.000000, -101.161407,
14.369474, -8.000000, -101.891479,
13.749530, -8.000000, -102.797821,
13.968772, -8.000000, -103.829323,
14.469959, -8.000000, -104.888268,
14.964800, -8.000000, -105.802879,
16.955986, -8.000000, -109.414169,
16.776617, -8.000000, -110.478836,
16.263479, -8.000000, -111.339577,
15.200941, -8.000000, -111.526329,
14.352178, -8.000000, -110.754326,
15.190737, -8.000000, -110.001801,
16.302240, -8.000000, -110.005722,
15.815475, -8.000000, -111.014900,
14.911292, -8.000000, -111.661888,
14.005045, -8.000000, -112.263855,
14.883535, -8.000000, -111.781982,
14.404255, -8.000000, -110.876640,
15.071056, -8.000000, -111.731522,
14.335340, -8.000000, -110.793587,
13.342915, -8.000000, -111.184967,
12.869198, -8.000000, -112.210732,
13.971279, -8.000000, -112.223083,
14.902745, -8.000000, -111.661880,
15.813969, -8.000000, -111.060051,
16.728361, -8.000000, -110.402679,
16.754343, -8.000000, -109.357780,
16.393435, -8.000000, -108.410202,
15.880263, -8.000000, -107.455299,
15.362660, -8.000000, -106.521095,
13.593607, -8.000000, -103.312202,
14.028812, -8.000000, -102.335686,
14.836555, -8.000000, -101.487602,
15.656289, -8.000000, -100.748199,
16.544455, -8.000000, -99.965248,
15.712431, -8.000000, -100.702980,
14.859239, -8.000000, -101.459091,
13.961225, -8.000000, -102.255051,
14.754376, -8.000000, -101.551842,
15.574628, -8.000000, -100.824944,
16.913191, -8.000000, -99.639374,
16.158613, -8.000000, -100.307716,
15.371163, -8.000000, -101.005310,
13.802610, -8.000000, -102.395645,
13.852294, -8.000000, -103.601982,
14.296268, -8.000000, -104.610878,
14.826925, -8.000000, -105.560638,
15.320851, -8.000000, -106.448463,
15.858366, -8.000000, -107.421883,
17.018456, -8.000000, -109.527451,
16.734596, -8.000000, -110.580498,
16.095715, -8.000000, -111.542282
};

function onSpawn(npc)
    npc:initNpcAi();
	npc:setPos(pathfind.first(path));
	onPath(npc);
end;

function onPath(npc)
	pathfind.patrol(npc, path);
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x00C8);
	npc:wait(-1);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,npc)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    npc:wait(0);
end;



