; 7.iss

; LavishScript "Objects" are the same concept as variables.
; All LavishScript variables are objects. Not all LavishScript Objects are variables. (there are objects provided)

; Being an "object" is what allows the use of members and methods (as these are concepts that belong to objects) with that variable.
; ... that's pretty much what "object-oriented" programming is all about

; In this example, we're going to look at an "int" variable as a LavishScript Object

; Objects can have "members" which give ways to retrieve data from the object, like this:    echo ${MyObject.MyMember}
; Objects can have "methods" which give ways to perform actions with the object, like this:   MyObject:MyMethod

function main()
{
    ; Here we're creating an Object called "MyInt". the type is "int"
    variable int MyInt=1

    echo ${MyInt} ==> Set[1]
    ; ==> echo 1

    ; the "int" type defines various members and methods...
    ; including a method called "Set" which takes one parameter, calculates any math, and sets its storage to the new value
    MyInt:Set[2]

    echo ${MyInt} ==> Set[2]
    ; ==> echo 2

    MyInt:Set[2+1]
    
    echo ${MyInt} ==> Set[2+1]
    ; ==> echo 3

    ; it also has "Inc" and "Dec" methods, which do something similar, but instead of setting to the new value, they add or subtract
    MyInt:Inc[2+1]

    echo ${MyInt} ==> Inc[2+1]
    ; ==> echo 6

    MyInt:Dec[1+1]

    echo ${MyInt} ==> Dec[1+1]
    ; ==> echo 4

    ; the "int" type also has an "AsJSON" member, which returns a valid JSON representation of the value.
    ; in the case of "int", that is just the number itself, there is no extra formatting required for a number in JSON
    echo MyInt.AsJSON ==> ${MyInt.AsJSON}
    ; ==> echo 4

    ; the "int" type also has a .Equal member, which determines if the int is equal to another int, and returns a bool
    echo ${MyInt}==4? ${MyInt.Equal[4]}
    ; ==> echo 4==4? TRUE

    echo ${MyInt}==5? ${MyInt.Equal[5]}
    ; ==> echo 4==5? FALSE
}