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

        LGUI2:LoadPackageFile[game.json]
    }

    ; destructor
    method Shutdown()
    {
        LGUI2:UnloadPackageFile[game.json]
    }

    ; to be called by a LGUI2 "onRefresh" event handler, e.g. from the game viewer element
    method OnRefresh()
    {
		CurrentFrame:Set[${Script.RunningTime}/1000.0]
		if ${CurrentFrame.Equal[${LastFrame}]}
			return

		FrameTime:Set[${CurrentFrame}-${LastFrame}]
        This:UpdateGame
		LastFrame:Set[${CurrentFrame}]
    }

     ; called by OnRefresh, add game logic here. use ${This.FrameTime} to calculate any distances moved, etc.
    method UpdateGame()
    {
    }
}

variable(global) gameController GameController

function main()
{
    while 1
        waitframe
}