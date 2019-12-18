; 4.iss

; In this example, we take an input number, change it somehow, and echo the result.

; main takes one parameter, an integer. if not provided, it will use the value 0 by default (because it is an int)
function main(int param1)
{
    ; variable int Return
    ; we're going to do this by calling a different function, with the Call command
    call change_value ${param1}
    ; the function returned a result. so how do we access it? 
    ; Return:Set[8]

    ; LavishScript provides a "Return" object, which holds the "return"ed value from the last Call 
    echo ${Return}
}

; Here's our other function, which is just going to take a value, make a change to it, and return the changed value
function change_value(int inputValue)
{
    ; let's change the value. we're just incrementing by 7. the function could be called "increment_value_by_7"
    inputValue:Inc[7]

    ; now let's return a new value
    return ${inputValue}
    ; ==> return 8
}
