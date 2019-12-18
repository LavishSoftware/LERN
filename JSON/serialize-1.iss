; what if we want to specify how our object is represented as JSON

objectdef person
{
    variable string FirstName="John"
    variable string LastName="Doe"

    ; if our objectdef has a member called "AsJSON", then various other functionality can use it in order to get the object as JSON
    member AsJSON()
    {
        ; We're not following a pre-defined schema that says the propety name for a person's first name HAS TO BE this or that.
        ; We get to make up the names. This is making up what the schema would have to say, for someone to know what values to get from our JSON, or make a compatible person with JSON.

        ; So we make up that we want our object to be like this:        
        /*
        {
            "first_name":"John",
            "last_name":"Doe"
        }
        */

        ; That means no matter how we decide to take our variables and form this text, we want it to turn out like this:
        return "{\"first_name\":\"John\",\"last_name\":\"Doe\"}"

        ; We can use a jsonvalue variable to build the JSON object dynamically.
        
        ; Here, we create a jsonvalue variable called "jo" (short for JSON object), and assign it the value {}  which is an empty JSON object
        variable jsonvalue jo={}

        ; jsonvalue itself has a few members and methods, but because it is currently representing a JSON object, jsonvalue gives access to "jsonobject" type members and methods as well, including a :Set[name,value]        
        ; like this: jo:Set[someStringProperty,"\"some string value\""]

        ; so we have our FirstName "John" and we want to end up with a line like...
        ; jo:Set[first_name,"\"John\""]

        ; There's many ways to get that.

        ; Here's one way to get this result
        jo:Set[first_name,"\"${FirstName}\""]
        ; That's fine. but if FirstName contains characters that would need to be escaped to be valid, there's no escaping happening.
        ; obviously right now, FirstName is hard-coded and does not contain anything like that.

        ; string has a member called "Escape" to handle escaping for us:
        jo:Set[first_name,"\"${FirstName.Escape}\""]
        ; This still produces the desired result

        ; Taking it one step further, string has an "AsJSON" member to take our string and make it a valid JSON string (putting it inside quotes)
        ; That way, we don't have to hard-code escaped quotes for string variables but add everything else (ints, etc) to JSON objects without hard-coded escaped quotes.
        ; Consistency is nice.
        jo:Set[first_name,"${FirstName.AsJSON.Escape}"]
        ; if we returned now, that's... {"first_name":"John"}

        ; Finally, let's add the last name as well.

        jo:Set[last_name,"${LastName.AsJSON.Escape}"]
        ; if we returned now, that's... {"first_name":"John","last_name":"Doe"}

        return "${jo.AsJSON.Escape}"
        ; ==> return "{\"first_name\":\"John\",\"last_name\":\"Doe\"}"
    }
}

function main()
{
    ; here, we make a new object using the "person" type, and we call it "Person1"
    variable person Person1

    echo ${Person1.AsJSON}
}