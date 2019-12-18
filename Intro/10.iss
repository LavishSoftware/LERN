; 10.iss

; what if we want to do something when our object is destroyed?

objectdef person
{
    variable string FirstName="John"
    variable string LastName="Doe"

    ; If our objectdef has a method called "Shutdown", LavishScript will call it when our person variable is destroyed.
    ; This is just like having an EVENT HANDLER that executes ON CREATE.
    method Shutdown()
    {
        echo "${FirstName} ${LastName} is no longer available."
    }
}

function main()
{
    ; here, we make a new object using the "person" type, and we call it "Person"
    variable person Person
 
    echo ${Person.FirstName}
    ; ==> echo John

    echo ${Person.LastName}
    ; ==> echo Doe

    ; when this function ends, the variable called "Person" goes out of scope, and will be destroyed. calling Shutdown
}