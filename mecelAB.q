//This file was generated from (Academic) UPPAAL 4.1.18 (rev. 5444), November 2013

/*

*/
A[]((ErrStat == 0&&UseCase == 0&&gcInitiate) imply SysTimer<=899)

/*

*/
A[]((ErrStat == 0&&UseCase == 0&&gcInitiate) imply SysTimer<=900)

/*

*/
------------------------------------------Property 15, 16-------------------------------------------------------------

/*

*/
A[] ((GearControl.Gear and ( Interface.GearR or Interface.Gear1 or Interface.Gear2 or Interface.Gear3 or Interface.Gear4 or Interface.Gear5) )\
        imply Engine.Torque)

/*

*/
E<> (Interface.GearN or Interface.GearR or Interface.Gear1 or Interface.Gear2 or Interface.Gear3 or Interface.Gear4 or Interface.Gear5)

/*

*/
------------------------------------------Property 13,14-------------------------------------------------------------

/*

*/
A[] (Engine.Torque imply Clutch.Closed)

/*

*/
A[] (Engine.ErrorSpeed imply ErrStat != 0) 

/*

*/
A[] (GearControl.GNeuError imply GearBox.ErrorNeu) 

/*

*/
A[] (GearControl.GSetError imply GearBox.ErrorIdle) 

/*

*/
A[] (GearControl.COpenError imply Clutch.ErrorOpen) 

/*

*/
A[] (GearControl.CCloseError imply Clutch.ErrorClose) 

/*

*/
------------------------------------------Property 7,8,9,10,11,12--------------------------------------------------------------

/*
GB.ErrorNeu is unreachable
*/
E<>(GearBox.ErrorNeu)

/*
Property5. while GB.ErrorNeu set z:=0,gbei := true;   while GC.GNeuError set gben:false

*/
A[](gben imply gbenClock<=200)

/*

*/
//NO_QUERY

/*

*/
sup{gbei}:gbeiClock

/*
Property5. while GB.ErrorIdle set z:=0,gbei := true;   while GC.GSetError set gbei:false
*/
A[](gbei imply gbeiClock<=350)

/*

*/
//NO_QUERY

/*
slowest time, whichi returns z<= 50
*/
sup{ceo}:ceoClock

/*

*/
A[](ceo imply ceoClock<=50)

/*
Property 4. using model decoration, while Clutch.ErrorOpen set z:=0, ceo := true;   while GC.COpenError set cec:false
*/
A[](ceo imply ceoClock<=200)

/*

*/
//NO_QUERY

/*

*/
 A[]( Clutch.ErrorClose and cecClock>50  imply GearControl.CCloseError )

/*

*/
 A[]( Clutch.ErrorClose and GearControl.GCTimer>200  imply GearControl.CCloseError )

/*
slowest time, whichi returns z<= 50
*/
sup{cec}:cecClock

/*

*/
A[](cec imply cecClock<=50)

/*
Property 3. using model decoration, while Clutch.ErrorClose set z:=0, cec := true;   while GC.CloseError set cec:false
*/
A[](cec imply cecClock<=200)

/*

*/
------------------------------------------Property 3,4,5,6--------------------------------------------------------------

/*
choose the fastest path see the systimer , we can see it at least need 150
*/
E<> (ErrStat==0 and UseCase ==0 and GearControl.GearChanged)

/*
fastest time, whichi returns >=150
*/
inf{(ErrStat==0 and UseCase ==0 and GearControl.GearChanged)}:SysTimer

/*
slowest time, whichi returns < 900
*/
sup{(ErrStat==0 and UseCase ==0 and GearControl.GearChanged)}:SysTimer

/*
Property 2. SysTimer <=1000
*/
GearControl.Initiate --> (((ErrStat==0&&UseCase==0) imply GearControl.GearChanged) and SysTimer <=1000)

/*

*/
------------------------------------------Property 2--------------------------------------------------------------

/*
choose the fastest path see the systimer , we can see it at least need 150
*/
E<> (ErrStat==0 and GearControl.GearChanged)

/*
fastest time, whichi returns >=150
*/
inf{(ErrStat==0 and GearControl.GearChanged)}:SysTimer

/*
slowest time, whichi returns < 1205
*/
sup{(ErrStat==0 and GearControl.GearChanged)}:SysTimer

/*
Property 1.  the original one is SysTimer <= 1500
*/
GearControl.Initiate --> (((ErrStat==0) imply GearControl.GearChanged) and SysTimer <=1500)

/*

*/
------------------------------------------Property 1--------------------------------------------------------------
