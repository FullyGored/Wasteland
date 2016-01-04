#include "dialog\buildstoreDefines.sqf";
disableSerialization;

//if(objStoreCart > (player getVariable "cmoney")) exitWith {hintsilent "You do not have enough money"};
//objshop_cart

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
_ObjectsInArea = [];

//_price = _x select 1;
//if(_price > (player getVariable "cmoney")) exitWith {hintsilent "You do not have enough money"};

// Grab access to the controls
_dialog = findDisplay buildshop_DIALOG;
_cartlist = _dialog displayCtrl buildshop_cart;
_totalText = _dialog displayCtrl buildshop_total;
_playerMoneyText = _Dialog displayCtrl buildshop_money;
_size = lbSize _cartlist;
_itemlist = _dialog displayCtrl buildshop_item_list;

//hintsilent "Checking Purchase";
closeDialog objshop_DIALOG;

//Buy
for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_selectedItem = lbCurSel _itemlist;
	_itemText = _itemlist lbText _selectedItem;
	{if(_itemText == _x select 0) then{
		sleep 1;
                _new_obj = (_x select 2);
                { if (_new_obj == _x select 0) then { _Objtype = _x; hint format["_Objtype = %1", _Objtype]; } }forEach objectList;
		_dir = getdir player;
		_pos = getPos player;
		_pos = [(_pos select 0)+20*sin(_dir),(_pos select 1)+20*cos(_dir),0];
		_old_obj = nearestObjects [_pos, 5];
		{deleteVehicle _x} forEach _old_obj;
		_obj = createVehicle [_new_obj, _pos, [], 0, "CAN_COLLIDE"];
		_obj setDir _dir;
                _ObjHealth = _Objtype select 1;
                if(_ObjHealth == 0)then{
                  _obj setVariable["health",30,true];
                  _obj setVariable["healthTotal",30,true];
                }else{
                  _obj setVariable["health",_ObjHealth,true];
                  _obj setVariable["healthTotal",_ObjHealth,true];
                };
                _obj setVariable["isCritical",false,true];
                _obj setVariable["isExplosiveImmune",_Objtype select 2,true];
                _obj setVariable["isBallisticImmune",_Objtype select 2,true];
                _obj setVariable["spawnpos",_pos,true];
                _obj setVariable["respawn",false,true];
                _initCmd = format["this addEventHandler [""HandleDamage"",{ [_this select 0,_this select 2,_this select 4] call onObjectHit }];"];
                _obj setVehicleInit _initCmd;
                _obj setVariable["R3F_LOG_disabled", false, true];
                _obj setVariable["notahackedvehicle",1,true];
                _obj setpos [getpos _obj select 0,getpos _obj select 1,0];
	}}forEach BuildStoreArray;
};