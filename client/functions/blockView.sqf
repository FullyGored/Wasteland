/*
Block commander view for groupleaders.
 
Add the following line to playerSetup.sqf
[] execVM "client\functions\blockView.sqf";
 
Author: gn1p 

*/
 
while {alive player} do {
    if(cameraView == "GROUP") then {
        vehicle player switchCamera "EXTERNAL";
        player globalchat "commander view disabled";    
    };
    sleep 0.5;
};