; This time, let's use jsonvalueref instead of converting back and forth between text and objects
; We're also going to get funky by creating an index:person, initializing (deserializing) it from a JSON array, and re-serializing the array from the index

objectdef person
{
    variable string FirstName
    variable string LastName

    ; here's our new initializer, which can be used by index:FromJSON to initialize our person from JSON
    method Initialize(jsonvalue jo)
    {
        ; we'll reference the parameter and do the actual work in our own FromJSON method
        This:FromJSON[jo]
    }

    ; this one matches the old SetFromJSON, from serialize-2.iss
    method SetFromJSON(jsonvalue jo)
    {
        ; we can use our new method efficiently by referencing the parameter
        This:FromJSON[jo]
    }

    ; This FromJSON method requires a reference to a JSON value, rather than an eplicit value
    method FromJSON(jsonvalueref jo)
    {
        ; we expect "jo" to reference a JSON object like this...
        /*
        {
            "first_name":"John",
            "last_name":"Doe"
        }
        */

        ; we can inspect what we received
        echo "FromJSON: ${jo~}"

        ; if it's not a valid JSON object, let's not!
        if !${jo.Type.Equal[object]}
            return

        ; looks like we're good, retrieve our values
        FirstName:Set["${jo.Get[first_name]~}"]
        LastName:Set["${jo.Get[last_name]~}"]        
    }

    ; if our objectdef has a member called "AsJSON", then various other functionality can use it in order to get the object as JSON. Here we return a jsonvalueref instead of a string, for maximum efficiency :)
    member:jsonvalueref AsJSON()
    {
        variable jsonvalue jo={}
        jo:SetString[first_name,"${FirstName~}"]
        jo:SetString[last_name,"${LastName~}"]
        return jo
    }
}

function main()
{
    ; here we have our index:person called Persons
    variable index:person Persons

    variable jsonvalue jaPersons
    ; LavishScript $$><$$ notation lets us handily drop JSON directly into our LavishScript code
    jaPersons:SetValue["$$>
    [
        {
            "first_name":"John",
            "last_name":"Doe"
        },
        {
            "first_name":"Jane",
            "last_name":"Doe"
        },
        {
            "first_name":"John",
            "last_name":"Public"
        }
    ]
    <$$"]

    ; JSON in
    echo "input =${jaPersons~}"
    Persons:FromJSON["${jaPersons~}"]

    ; JSON out
    echo "output=${Persons.AsJSON~}"
}
