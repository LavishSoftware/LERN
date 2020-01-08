function main(string Phrase="\"Hello World!\"")
{    
    echo Hop 1 hears: ${Phrase}
    call Telephone_Hop2 "${Phrase~}"
}

function Telephone_Hop2(string Phrase)
{
    echo Hop 2 hears: ${Phrase}
    call Telephone_Hop3 ${Phrase}
}

function Telephone_Hop3(string Phrase)
{
    echo Hop 3 hears: ${Phrase}
    call Telephone_Hop4 "${Phrase~}"
}

function Telephone_Hop4(string Phrase)
{
    echo "Hop 4 hears: ${Phrase~}"    
}

