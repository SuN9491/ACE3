/*
 * Author: Glowbal, Ruthberg
 * Handles wind deflection for projectiles. Called from the unified fired EH only for players on foot and their vehicles if required by settings.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_advanced_ballistics_fnc_handleFired
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false] && (_projectile isKindOf "BulletBase") && (_unit isKindOf "Man")) exitWith {false};

if (!((_projectile isKindOf "BulletBase") || (_projectile isKindOf "GrenadeBase"))) exitWith {false};
if (_unit distance ACE_player > GVAR(simulationRadius)) exitWith {false};

GVAR(trackedBullets) pushBack [_projectile, getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction")];
