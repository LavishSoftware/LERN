; This time we're going to have a person index.

objectdef person
{
    variable string FirstName
    variable string LastName

    ; this Initialize method will accept a first and last name when creating a person.
    method Initialize(string first, string last)
    {
        ; all it has to do is fill in the FirstName and LastName with the provided values
        FirstName:Set["${first~}"]
        LastName:Set["${last~}"]
    }

    ; this member defines how our object is represented in JSON
    member:string AsJSON()
    {        
        variable jsonvalue jo={}
        jo:Set[first_name,"${FirstName.AsJSON~}"]
        jo:Set[last_name,"${LastName.AsJSON~}"]
        return "${jo.AsJSON~}"
        ; ==> return "{\"first_name\":\"John\",\"last_name\":\"Doe\"}"
    }
}

function main()
{
    variable index:person People

    ; This time, Insert is called with 2 parameters. That's because person:Initialize takes 2 parameters.
    People:Insert["John","Doe"]
    People:Insert["Jane","Doe"]
    People:Insert["John","Public"]

    ; And let's check out the JSON
    echo ${People.AsJSON}
    ; ==> [{"first_name":"John","last_name":"Doe"},{"first_name":"Jane","last_name":"Doe"},{"first_name":"John","last_name":"Public"}]
}