function main()
{
    variable string TextToPass="He said, \"I don't think he's heard of SecondFunction\""

    call SecondFunction "Call Unescaped and Unquoted" ${TextToPass}
    call SecondFunction "Call Unescaped and Quoted" "${TextToPass}"
    call SecondFunction "Call Escaped and Quoted" "${TextToPass~}"
}

function SecondFunction(string prefix, string TextToDisplay)
{
    echo ${prefix}. Echo Unquoted: ${TextToDisplay}
    echo ${prefix}. Echo Quoted: ${TextToDisplay~}
}
