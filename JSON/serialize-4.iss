; This time we'll initialize a collection, keyed by the person's full name, using the same person object from serialize-3

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
    ; here we have our collection:person called Persons
    variable collection:person Persons

    variable jsonvalue jaPersons
    ; LavishScript $$><$$ notation lets us handily drop JSON directly into our LavishScript code
    ; this is the same array from serialize-3.iss
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
    echo "input as array =${jaPersons~}"
    ; because we have an array input instead of an object, we're going to use jsonarray:ForEach to add each person to the collection, instead of using collection:FromJSON
    jaPersons:ForEach["Persons:Set[\"\${ForEach.Value.Get[first_name]~} \${ForEach.Value.Get[last_name]~}\",\"\${ForEach.Value~}\"]"]

    ; JSON out, in the form of an object. This will not match the input, because the input was an array.
    echo "output as object=${Persons.AsJSON~}"

    ; JSON out in the form of an array. This will match the input
    echo "output as array=${Persons.AsJSON[array]~}"

    ; We can also use collection:FromJSON with our object output.
    variable jsonvalue joPersons
    joPersons:SetValue["${Persons.AsJSON~}"]

    ; clear the collection to show that we are fully re-creating it from our JSON
    Persons:Clear
    echo "--- cleared!"    

    echo "input as object  =${joPersons~}"
    Persons:FromJSON["${joPersons~}"]

    echo "output as object=${Persons.AsJSON~}"

    echo "output as array=${Persons.AsJSON[array]~}"    
}
