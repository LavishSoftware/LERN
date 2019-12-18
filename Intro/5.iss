; 5.iss

; We can make our own commands.

; an "atom" is a type of "function" with special properties. 
; one of those special properties is that it can be used like a command.
; let's make a command that echoes!
atom mycommand(string myparam)
{
    echo ${myparam}
}

; runscript lern/intro/5 hi
function main(string param1)
{
    mycommand "Hello World!"
    mycommand ${param1}
}