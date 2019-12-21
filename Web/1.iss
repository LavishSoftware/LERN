variable(global) webrequest WR

function main()
{
    variable uint lastState
    
    lastState:Set[${WR.State.Value}]
    echo WR.State=${lastState(ewebrequeststate)}

    WR:SetURL["https://raw.githubusercontent.com/LavishSoftware/LERN/master/LGUI2/1.json"]
    WR:InterpretAs[json]

    WR:Begin
    lastState:Set[${WR.State.Value}]
    echo WR.State=${lastState(ewebrequeststate)}
    echo WR.URL=${WR.URL}  WR.InterpretAs=${WR.InterpretAs}

    while 1
    {
        if ${WR.State.Value}!=${lastState}
        {
            lastState:Set[${WR.State.Value}]
            echo WR.State=${lastState(ewebrequeststate)}

            if ${WR.Result(exists)}            
                echo WR.Result=${WR.Result}    

            if ${WR.State.Name.Equal[Completed]}
                break
        }


        waitframe
    }

    echo Script ending.
}