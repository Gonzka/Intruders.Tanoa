/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         18.10.2020
	Description:	 Master Configuration File

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

//GENERAL
bis_revive_killfeedShow = false;
loadingText = "";
blockMainWeapon = false;
knockout = false;
meleeCooldown = 0;
openNotifications = [];
incapacitatedCounter = 0;
clothing_filter = 0;
clothing_equip = ["","","","","",""];
skillCheck_hit = false;

if (isNil {profileNamespace getVariable "intruders_perkInventory"}) then {
    profileNamespace setVariable ["intruders_perkInventory",[]];
};

private _globalInventory = profileNamespace getVariable "intruders_perkInventory";
private _config = missionConfigFile >> "VirtualItems";
{
    if (!isClass (_config >> _x)) then { //REMOVE ITEMS THAT DONT EXIST ANYMORE
	    _globalInventory deleteAt (_globalInventory find _x);
	};
} forEach _globalInventory;

profileNamespace setVariable ["intruders_perkInventory",_globalInventory];

//GLOBAL VARS
player setVariable ["spawnPoint", [], true];
player setVariable ["voiceActive", false, true];
player setVariable ["bloodPoints", 0, true];
player setVariable ["threatLevel", 0, true];
player setVariable ["oblivious", false, true];
player setVariable ["killer", ""];

//ABILITIES
cloakingCooldown = false;
portalTravelInUse = false;
unbreakable = false;
exhausted = false;
beartraps = 6;

//ITEMS
firstAidKits = 0;
toolboxCharges = 0;
circuits = 0;
smokeBombs = 0;
firecrackers = 0;

//QUEST
player setVariable ["quest_kills", 0, true];
player setVariable ["quest_stuns", 0, true];
player setVariable ["quest_knockDowns", 0, true];
player setVariable ["quest_bearTrapCatches", 0, true];
//player setVariable ["quest_heals", 0, true];
player setVariable ["quest_endgameKill", false, true];
quest_generators = 0;
quest_chests = 0;
quest_skillCheckCombo = 0;
quest_terrorGenerators = 0;
quest_selfHeals = 0;
quest_portalTravels = 0;
quest_uncloakingHit = 0;
quest_escape = false;
quest_hit_openTimeSlot = false;
quest_killAll = false;
quest_thoroughCleansing = false;

//PERKS
private _perkVar = format ["intruders_activePerks_%1",if (playerSide isEqualTo east) then {"killer"} else {"survivor"}];
if (isNil {profileNamespace getVariable _perkVar}) then {
    profileNamespace setVariable [_perkVar,["","","",""]];
};
if (count (profileNamespace getVariable _perkVar) isEqualTo 3) then { profileNamespace setVariable [_perkVar,["","","",""]]; }; //TEMPORARY
player setVariable ["intruders_activePerks", profileNamespace getVariable _perkVar, true]; //PUBLIC VAR

//BLOODPOINTS
private _currencyVar = "intruders_bloodPoints";
if (isNil {profileNamespace getVariable _currencyVar}) then {
	profileNamespace setVariable [_currencyVar,0];
};

saveProfileNamespace;

diag_log format ["[Intruders Client] Player: %1 (%2) | Perks: %3 | Bloodpoints: %4 | Date: %5", profileName, getPlayerUID player, _globalInventory, profileNamespace getVariable _currencyVar, systemTime];
diag_log ("configuration" + str(diag_ticktime));