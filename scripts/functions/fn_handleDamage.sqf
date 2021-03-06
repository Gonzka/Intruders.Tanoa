/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         15.01.2021
	Description:	 Handles damage

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

if (!isNull _source && {_source != _unit}) then {
	if (currentWeapon _source in ["arifle_AKS_F"] && _projectile in ["B_545x39_Ball_F"]) then {
	    if (alive _unit) then {
            if (playerSide isEqualTo east && {!knockout}) then {
			    [_unit,_source] spawn gonzka_fnc_knockedOut;
			};
		};
	};
};

damage _unit //NO DAMAGE