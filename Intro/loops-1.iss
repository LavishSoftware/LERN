; Loops!

; the methods in this objectdef will show the similarities and differences between the 3 types of loops
objectdef loops1
{
    ; The "while" loop
    ; "while" is a basic loop that first checks the condition, then does the inner code, and then starts again at the condition check
    method While()
    {
        echo method While() begins...
        variable int count=1
        while ${count}<10
        {
            echo While: ${count}
            count:Inc
        }
        echo method While() ends...
    }

    ; The "do..while" loop
    ; This type of while loop checks the condition AFTER doing the inner code, instead of at the start. 
    ; This also means the inner code always executes at least one time, even if the condition check never would have passed.
    method DoWhile()
    {
        echo method DoWhile() begins...
        variable int count=1
        do
        {
            echo DoWhile: ${count}
            count:Inc
        }
        while ${count}<10
        echo method DoWhile() ends...
    }
    
    ; The "for" loop
    ; "for" uses unique syntax not only in LavishScript, but also in C++, C#, Lua, etc. 
    ; It handles 3 pieces in this form, with parentheses and semi-colons required.
    ;    for ( START_COMMAND ; CONDITION ; INCREMENT_COMMAND )

    ; The START_COMMAND may also be ommitted when the variable was previously set to the desired value. In this case, only two pieces are required:
    ;    for ( CONDITION ; INCREMENT_COMMAND )

    ; "for" loops will always perform the START_COMMAND, then check the CONDITION at the start of the loop, doing INCREMENT_COMMAND after the inner code before checking CONDITION again.
    method For()
    {
        echo method For() begins...
        variable int count
        for ( count:Set[1] ; ${count}<10 ; count:Inc )
        {
            echo For: ${count}
        }

        echo method For() ends...
    }
}

function main()
{
    variable loops1 Loops1

    Loops1:While
    Loops1:DoWhile
    Loops1:For
}