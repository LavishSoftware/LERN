; this is a basic Game Controller skeleton, copied from game.iss and game.json

objectdef gameController
{
    ; timestamps in seconds since the script started
	variable float CurrentFrame    
	variable float LastFrame

    ; amount of time (in seconds) elapsed since the last frame
	variable float FrameTime

    ; constructor
    method Initialize()
    {
		CurrentFrame:Set[${Script.RunningTime}/1000.0]
		LastFrame:Set[${CurrentFrame}]

        LGUI2:LoadPackageFile[1.json]
    }

    ; destructor
    method Shutdown()
    {
        LGUI2:UnloadPackageFile[1.json]
    }

    ; to be called by a LGUI2 "onRefresh" event handler, e.g. from the game viewer element
    method OnRefresh()
    {
        ; update the Current Frame timestamp
		CurrentFrame:Set[${Script.RunningTime}/1000.0]

        ; if no time has passed, wait longer...
		if ${CurrentFrame.Equal[${LastFrame}]}
			return

        ; update FrameTime 
		FrameTime:Set[${CurrentFrame}-${LastFrame}]
        This:UpdateGame
		LastFrame:Set[${CurrentFrame}]
    }

     ; called by OnRefresh, add game logic here. use ${This.FrameTime} to calculate any distances moved, etc.
    method UpdateGame()
    {
        ; distance moved = speed * time
        ; Player.X:Inc[${SpeedX} * ${This.FrameTime}]

        ; Ball.X:Inc[${SpeedX} * ${This.FrameTime}]

        ; etc

        ; make sure to do anything needed to update GUI to show the user!        
    }
}

variable(global) gameController GameController

function main()
{
    while 1
        waitframe
}