; 9.iss

; example 8 was simple enough. what if we want to do anything else, besides set the values of FirstName and LastName, when our object is created?

; this time, any time a person is created, let's also do an echo

objectdef person
{
    variable string FirstName
    variable string LastName

    ; If our objectdef has a method called "Initialize", LavishScript will call it when our person variable is created.
    ; This is just like having an EVENT HANDLER that executes ON CREATE.
    method Initialize()
    {
        FirstName:Set["John"]
        LastName:Set["Doe"]
        
        echo person:Initialize FirstName=${FirstName} LastName=${LastName}
        ; ==> echo person:Initialize FirstName=John LastName=Doe
    }
}

function main()
{
    ; here, we make (create...) a new object using the "person" type, and we call it "Person"
    variable person Person    

    echo ${Person.FirstName}
    ; ==> echo John

    echo ${Person.LastName}
    ; ==> echo Doe
}