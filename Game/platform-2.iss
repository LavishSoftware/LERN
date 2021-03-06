; this example adds music and sound effects to make a slightly more enjoyable experience

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

        LGUI2:LoadPackageFile[platform-2.json]

        ; take keyboard focus
        LGUI2.Element[game.board]:KeyboardFocus

        ; play background music on infinite loop
        Audio.Voice[game.music]:PlayStream[exploration,-1]
    }

    ; destructor
    method Shutdown()
    {
        LGUI2:UnloadPackageFile[platform-2.json]

        ; ensure all of our sound has stopped
        Audio.Voice[game.music]:Stop:ClearQueue
        Audio.Voice[game.player]:Stop:ClearQueue
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

; here, when the user presses Left/Right (or A/D), we set the movement speed on the appropriate axis
; if the user presses Escape, the game terminates.
        switch ${Context.Args[controlName]}
        {
            case Esc
                Script:End
                break
            case A
            case Left
                if ${Context.Args[position]}
                    SpeedX:Set[-${BaseSpeed}]
                else
                    SpeedX:Set[0]
                break
            case D
            case Right
                if ${Context.Args[position]}
                    SpeedX:Set[${BaseSpeed}]
                else
                    SpeedX:Set[0]
                break
       ; in this platform-style example, Y axis is controlled by gravity and by jumping, so Y movement is not calculated the same way as X
            case Space
             if ${Context.Args[position]}
                    This:Jump
                break
        }
    }

    method Jump()
    {
        ; jumping will only be available if we're on the ground and not already set to jump
        if ${SpeedY} || !${This.IsOnGround}
            return

        ; set the initial jump force here. downward acceleration (positive SpeedY increase) will occur due to gravity afterward.
        SpeedY:Set[-2*${BaseSpeed}]

        Audio.Voice[game.player]:PlayStream[squeak-out]
    }
    
    member:bool IsOnGround()
    {
        ; the only way we're on the ground in this example is the bottom of the board.

        ; we will need to calculate based on the top left corner of the game.player element.
        variable float Y=${LGUI2.Element[game.player].Y}
        Y:Inc[${LGUI2.Element[game.player].ActualHeight}]

        ; Y is now the bottom of the game.player, to test against the height of game.board

        ; we're on the ground if Y == Height, and we're underground if Y > Height. either way, we want to stop moving downward...        
        if ${Y}>=${LGUI2.Element[game.board].ActualHeight}
        {
            return TRUE
        }
        return FALSE
    }

    ; updates the game.player audio voice left/right volumes, depending on player position on the game board
    method UpdatePlayerAudio()
    {

        variable float pctX=0.5
        if ${LGUI2.Element[game.board].ActualWidth}
        {
            pctX:Set[ ( ${LGUI2.Element[game.player].X}+( ${LGUI2.Element[game.player].ActualWidth}/2 ) ) / ${LGUI2.Element[game.board].ActualWidth} ]
        }

        if ${pctX}<0
            pctX:Set[0]
        elseif ${pctX}>1
            pctX:Set[1]
        variable float useLeft
        variable float useRight

        useLeft:Set[(1-${pctX})*2]
        useRight:Set[(${pctX})*2]

        if ${useLeft}>1
            useLeft:Set[1]
        if ${useRight}>1
            useRight:Set[1]

        Audio.Voice[game.player]:SetVolume[${useLeft},${useRight}]
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

        ; update the element with the new calculations
        LGUI2.Element[game.player]:SetLocation[${newX},${newY}]

        ; Note: In this example, no X-axis bounds/collision detection or handling is implemented. the player can move out of the game area!

        ; now let's implement bounds checking on Y, and acceleration downward (gravity)
        if ${This.IsOnGround}
        {
            ; we're on the ground, so make sure we have no positive Y axis movement.
            if ${SpeedY}>0
            {
                SpeedY:Set[0]

                ; we just landed, don't land underground...
                newY:Set[${LGUI2.Element[game.board].ActualHeight}-${LGUI2.Element[game.player].ActualHeight}]
                LGUI2.Element[game.player]:SetLocation[${newX},${newY}]


                Audio.Voice[game.player]:PlayStream[squeak-in]
            }
            ; negative Y axis movement is okay, it means we're jumping.
        }
        else
        {            
            ; we're not on the ground, so apply gravity.
            SpeedY:Inc[${BaseSpeed}*5*${This.FrameTime}]
        }

        ; and finally, let's make the game.player sound volume adjust left/right depending on where the (midpoint of the) player is!
        This:UpdatePlayerAudio
    }
}

variable(global) gameController GameController

function main()
{
    while 1
        waitframe
}