; 11.iss

; what if we want to specify what it shows when we do echo ${MyObject}

objectdef person
{
    variable string FirstName="John"
    variable string LastName="Doe"

    ; if our objectdef has a member called "ToText", then LavishScript will use it when it wants to convert a person to text    
    member ToText()
    {
        return "${FirstName.Escape} ${LastName.Escape}"
    }
}

function main()
{
    variable int MyInt=4
    echo ${MyInt}
    ; echo 4

    ; here, we make a new object using the "myobjectdef" type, and we call it "MyObject"
    variable person Person

    echo ${Person}
    ; ==> echo Hello World!

}