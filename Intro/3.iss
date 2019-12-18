; 3.iss

; This time, main accepts an int. If no int is given, ints default to 0
; so, "runscript lern/intro/3" will have someValue being 0, and "runscript lern/intro/3 1" will have someValue being 1
function main(int someValue)
{
    echo someValue=${someValue}

    ; We can have other "functions" too. A "function" is called with the "Call" command, which works like RunScript except you provide a function name instead of a script name.
    ; See: 
    ;    command..   script/function  someValue
    ;    RunScript   lern/intro/3     1
    ;    Call        other_function   1
    call other_function ${someValue}
}

function other_function(int someValue)
{
    ; I'm a function, just like "main"! 
    echo someValue=${someValue}
}


