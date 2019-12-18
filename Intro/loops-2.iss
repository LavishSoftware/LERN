; Loops with "continue" and "break"
; "break" skips out of the loop
; "continue" skips past the rest of the inner code, but not out of the loop

; the methods in this objectdef will show the similarities and differences between the 3 types of loops
objectdef loops2
{
    ; The "while" loop
    ; "while" is a basic loop that first checks the condition, then does the inner code, and then starts again at the condition check
    ; this is another way of writing essentially the same While loop from example 17
    method While()
    {
        echo method While() begins...
        variable int count=1
        while TRUE
        {
            ; this is how the original condition works, by breaking from the loop if it does not match
            if !(${count}<10)
                break                

            echo While: ${count}
            count:Inc

            ; skip the rest of the inner code
            continue

            ; anything directly below the continue doesn't happen, because it jumped from the continue to somewhere else.
            echo I never happen

            ; this is where a "continue" jumps
        }
        ; this is where a "break" jumps
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

            ; for funsies, let's use "continue" but only if ${count}<10    that's the original condition
            if ${count}<10
                continue

            ; at this point, our original condition is no longer met, so I can tell you one thing ...
            echo count must be exactly 10             
            ; now because our original condition is no longer met ... it's going to break, below.

            ; this is how the original condition works, by breaking from the loop if it does not match
            if !(${count}<10)
                break

            ; this is where a "continue" jumps
        }
        while TRUE
        ; this is where a "break" jumps
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
        for ( count:Set[1] ; TRUE ; count:Inc )
        {
            ; this is how the original condition works, by breaking from the loop if it does not match
            if !(${count}<10)
                break

            echo For: ${count}
            ; skip the rest of the inner code
            continue

            ; anything directly below the continue doesn't happen, because it jumped from the continue to somewhere else.
            echo I never happen

            ; this is where a "continue" jumps. "count:Inc" occurs after.
        }
        ; this is where a "break" jumps
        echo method For() ends...
    }
}

function main()
{
    variable loops2 Loops2

    Loops2:While
    Loops2:DoWhile
    Loops2:For
}