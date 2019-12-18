function main()
{
    echo -----------------
    echo JSON/2.iss begins
    echo -----------------

    variable jsonvalue joPerson={}

        /*
        {
            "first_name":"John",
            "last_name":"Doe"
        }
        */

    joPerson:Set["first_name","\"John\""]
    joPerson:Set["last_name","\"Doe\""]

    echo full joPerson=${joPerson}
    ; ==> echo {"first_name":"John","last_name":"Doe"}

    echo ${joPerson.Get[first_name]} ${joPerson.Get[last_name]}
    ; ==> echo John Doe

    joPerson:WriteFile[2.person.json]

    ; clear our object so it contains no properties
    joPerson:Clear

    echo After clear joPerson=${joPerson}
    ; echo {}

    joPerson:ParseFile[2.person.json]

    echo after ParseFile joPerson=${joPerson}
}