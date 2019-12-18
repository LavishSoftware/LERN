; 6.iss

; ATOM, WHAT DOES THAT EVEN MEAN:
; Calling something atomic means that it cannot be further broken down.

; the main difference between a LavishScript "function" and an "atom" is that a "function" can wait until later frames, while an "atom" must process immediately.
; otherwise, an "atom" is a function. it is a specific type of function.

; here is an atom that accepts one parameter
atom mycommand(string myparam)
{
    echo ${myparam}

    ; not valid:
    waitframe
    ; this produces an error: 'WaitFrame' is not available in atoms.
}

; runscript lern/intro/6 hi
function main(string param1)
{
    mycommand "Hello World!"

    ; valid:
    waitframe

    mycommand ${param1}
}