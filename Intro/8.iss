; 8.iss

; We know a bit about "int" objects, let's look at how we set up our own type of objects.

; "objectdef" is short for "Object Definition", which tells LavishScript about an object type.
; "objectdef" is the same thing as a "class" in many other langauges

; Here we create a "person" type, so we can make "person" objects (variables, etc!)
objectdef person
{
    variable string FirstName="John"
    variable string LastName="Doe"
}

function main()
{
    ; here, we make a new object using the "person" type, and we call it "Person"
    variable person Person
 
    echo ${Person.FirstName}
    ; ==> echo John

    echo ${Person.LastName}
    ; ==> echo Doe
}