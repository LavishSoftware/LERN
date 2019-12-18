; Scripts can take parameters.
; Like this: run <scriptname> "parameter 1" "parameter 2" etc

; This main function takes a parameter called param1. it is a string. Strings default to an empty string if not provided.
; For the main function, extra parameters passed to the RunScript command are passed in to the script.
function main(string param1)
{
    ; param1 is esentially a variable here now:
    ; variable string param1    

    ; We'll echo the first parameter passed to the function, which is the second parameter passed to RunScript
    echo param1=${param1}
}