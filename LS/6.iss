function GetTheAnswer()
{
    ; to the great question of life, the universe, and everything?
    return 42
}

function main()
{
    call GetTheAnswer
    echo ${Return}
    ; We're going to get lynched, aren't we?
}
