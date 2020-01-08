atom tight()
{
    echo "Tight, bro"
    ; waitframe
}

function main()
{
    tight

    echo [${Script.RunningTime}ms] waitframe
    waitframe

    echo [${Script.RunningTime}ms] wait -s 2.04
    wait -s 2.04

    echo [${Script.RunningTime}ms] ... at least 2.04 seconds later!
}

atom atexit()
{
    echo "atexit executes now!"
}