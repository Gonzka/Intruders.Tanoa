/*
    Author:	Gonzka

    Spectator client initialization file
*/

waitUntil {!isNull (findDisplay 46)};
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits; 
0 fadeRadio 0;
enableSentences false;
5 enableChannel false;

//Mapobjects
switch (worldName) do {
	case "Tanoa": {
        [] execVM "mapObjects\spawn_tanoa.sqf";
    };
	case "Malden": {
        [] execVM "mapObjects\spawn_malden.sqf";
    };
	case "Altis": {
        [] execVM "mapObjects\spawn_altis.sqf";
    };
};

//Required variables
openNotifications = [];

//Ambience music
playMusic selectRandom ["EventTrack02_F_EPB", "EventTrack01a_F_EPB", "EventTrack02a_F_EPB"];
setMusicEventHandler ["MusicStop", "playMusic selectRandom ['Music_Menu_Contact','Music_Roaming_Night','Music_Roaming_Night_02','Music_Roaming_Day','Music_Roaming_Day_02','OM_Music02','OM_Music03','AmbientTrack01a_F_Tacops','AmbientTrack01b_F_Tacops','AmbientTrack02a_F_Tacops','AmbientTrack02b_F_Tacops']"];