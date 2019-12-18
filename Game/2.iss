; this example shows the basics of translating user input into character movement

objectdef gameController
{
    ; timestamps in seconds since the script started
	variable float CurrentFrame    
	variable float LastFrame

    ; amount of time (in seconds) elapsed since the last frame
	variable float FrameTime

    ; speed the player is moving on each axis.
    ; direction in each axis is encoded as positive or negative speed:
    ; ... SpeedX < 0 results in subtracting from X, moving left
    ; ... SpeedX > 0 results in adding to X, moving right.
    variable float SpeedX
    variable float SpeedY

    ; Base Speed is used to determine how fast to move on an axis when the player is holding a movement key.
    variable float BaseSpeed=100

    ; constructor
    method Initialize()
    {
		CurrentFrame:Set[${Script.RunningTime}/1000.0]
		LastFrame:Set[${CurrentFrame}]

        LGUI2:LoadPackageFile[2.json]
    }

    ; destructor
    method Shutdown()
    {
        LGUI2:UnloadPackageFile[2.json]
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

    method OnButtonMove()
    {
      ;  echo OnButtonMove: ${Context(type)} source=${Countext.Source} args=${Context.Args}

; here, when the user presses an arrow key, we set the movement speed on the appropriate axis
; if the user presses Escape, the game terminates.
        switch ${Context.Args[controlName]}
        {
            case Esc
                Script:End
                break
            case Left
                if ${Context.Args[position]}
                    SpeedX:Set[-${BaseSpeed}]
                else
                    SpeedX:Set[0]
                break
            case Right
                if ${Context.Args[position]}
                    SpeedX:Set[${BaseSpeed}]
                else
                    SpeedX:Set[0]
                break
            case Up
                if ${Context.Args[position]}
                    SpeedY:Set[-${BaseSpeed}]
                else
                    SpeedY:Set[0]
                break
            case Down
                if ${Context.Args[position]}
                    SpeedY:Set[${BaseSpeed}]
                else
                    SpeedY:Set[0]
                break
        }
    }

     ; called by OnRefresh, add game logic here. use ${This.FrameTime} to calculate any distances moved, etc.
    method UpdateGame()
    {
        ; update the player location

        ; X = X + ( Speed * Time )   and  Y = Y + ( Speed * Time )

        ; first, start with the current values.
        variable float newX=${LGUI2.Element[game.player].X}
        variable float newY=${LGUI2.Element[game.player].Y}

        ; ... and add Speed * Time. Remember, SpeedX and SpeedY may be negative.
        newX:Inc[ ${SpeedX} * ${This.FrameTime} ]
        newY:Inc[ ${SpeedY} * ${This.FrameTime} ]
        
        ; Note: In this simple example, no bounds/collision detection or handling is implemented. the player can move out of the game area!

        ; now update the element with the new calculations
        LGUI2.Element[game.player]:SetLocation[${newX},${newY}]
    }
}

variable(global) gameController GameController

function main()
{
    while 1
        waitframe
}