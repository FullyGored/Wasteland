//	@file Version: 1.0
//	@file Name: missionDefines.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19

//CQ Mission Colour = #4BC9B0 - Turquoise 
//Fail Mission Colour = #FF1717 - Light red
//Fail Mission Colour = #17FF41 - Light green
//Sub Colour = #FFF - White
#include "setup.sqf"
#ifdef __DEBUG__

	#define cqMissionTimeout 500
	#define cqMissionDelayTime 40

#else

 	#define cqMissionTimeout 1800
 	#define cqMissionDelayTime 900
// 	#define cqMissionTimeout 180
// 	#define cqMissionDelayTime 60


#endif

#define missionRadiusTrigger 50
#define cqMissionColor "#4BC9B0"
#define failMissionColor "#FF1717"
#define successMissionColor "#17FF41"
#define subTextColor "#FFFFFF"