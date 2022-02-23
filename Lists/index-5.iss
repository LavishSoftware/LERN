; This time we're going to use JSON to initialize the person index

objectdef person
{
    variable string FirstName
    variable string LastName

    ; this Initialize method will accept a JSON value
    method Initialize(jsonvalue jo)
    {
        FirstName:Set["${jo.Get[first_name]~}"]
        LastName:Set["${jo.Get[last_name]~}"]
    }

    ; this member defines how our object is represented in JSON
    member:string AsJSON()
    {        
        variable jsonvalue jo
        jo:SetValue["$$>
        {
            "first_name":${FirstName.AsJSON~},
            "last_name":${LastName.AsJSON~}
        }
        <$$"]
        return "${jo.AsJSON~}"
        ; ==> return "{\"first_name\":\"John\",\"last_name\":\"Doe\"}"
    }
}

function main()
{
    variable index:person People

    ; index:FromJSON accepts a JSON array, effectively doing an index:Insert with each item in the array.
    ; That will call person:Initialize with each JSON object.
    People:FromJSON["$$>[
        {"first_name":"John","last_name":"Doe"},
        {"first_name":"Jane","last_name":"Doe"},
        {"first_name":"John","last_name":"Public"}
        ]<$$"]

    ; And let's check out the JSON
    echo ${People.AsJSON}
    ; ==> [{"first_name":"John","last_name":"Doe"},{"first_name":"Jane","last_name":"Doe"},{"first_name":"John","last_name":"Public"}]
}