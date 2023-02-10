/*
    Author:	Gonzka

    Initialization and spawn of survivors
*/

waitUntil {!(isNull (findDisplay 46))};
player enableStamina false;
player allowSprint false;

player setPos getMarkerPos ((player getVariable "spawnPoint") select 0);
player setDir (random 360);

[] spawn gonzka_fnc_createFogParticles;
[] spawn gonzka_fnc_initCharacter;
[] spawn gonzka_fnc_spawnCamera;
[] spawn gonzka_fnc_waterIsLava;

//PERKS
call gonzka_fnc_plunderersInstinct;
[] spawn gonzka_fnc_premonition;

if ("botanyKnowledge" in (player getVariable "intruders_activePerks")) then { //Survivor Perk Botany Knowledge
    player setUnitTrait ["Medic",true];
};

waitUntil {!(isNil "Killer")}; 
[Killer] spawn gonzka_fnc_terrorRadius;