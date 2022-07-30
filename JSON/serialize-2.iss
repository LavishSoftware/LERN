; what if we want to pull values FROM json to fill out our object
; we're going to match this up with the JSON object we made up in AsJSON in serialize-1.iss

objectdef person
{
    variable string FirstName
    variable string LastName

    ; We can make up a method that is kind of like "Set", and expects a JSON object as a parameter
    method SetFromJSON(jsonvalue jo)
    {
        ; so we expect "jo" to contain a JSON object like this...
        /*
        {
            "first_name":"John",
            "last_name":"Doe"
        }
        */

        ; first let's echo what we were given, so we have a visual understanding. it should look like the above comment.
        echo SetFromJSON: ${jo.AsJSON~}

        ; If jsonvalue contains a JSON object, then jsonvalue is providing members and methods from the jsonobject type, including the "Get" member.
        ; here's how we can access our properties:
        echo first_name=${jo.Get[first_name]}
        echo last_name=${jo.Get[last_name]}

        ; now we just need to put them into our LavishScript variables.
        FirstName:Set["${jo.Get[first_name]}"]
        ; this is okay... since we hard-coded the value John as the first_name, but if the first name was  .. Jack "the ripper"   then the result of the .Get should ideally be escaped
        ; as in:  jo.Get[____]~

        FirstName:Set["${jo.Get[first_name]~}"]
        LastName:Set["${jo.Get[last_name]~}"]        
    }

       ; if our objectdef has a member called "AsJSON", then various other functionality can use it in order to get the object as JSON
    member AsJSON()
    {
        ; see example12.iss
        variable jsonvalue jo={}
        jo:Set[first_name,"${FirstName.AsJSON~}"]
        jo:Set[last_name,"${LastName.AsJSON~}"]
        return "${jo.AsJSON~}"
        ; ==> return "{\"first_name\":\"John\",\"last_name\":\"Doe\"}"
    }
}

function main()
{
    ; here, we make a new object using the "person" type, and we call it "Person1"
    variable person Person1

    ; What if we check the .AsJSON right now?
    echo Person1.AsJSON=${Person1.AsJSON}    
    ; ==> echo Person1.AsJSON={"first_name":"","last_name":""}
    ; .. the default values (empty strings) are given!

    ; let's set the values using our pre-determined JSON
    Person1:SetFromJSON["{\"first_name\":\"John\",\"last_name\":\"Doe\"}"]

    ; NOW let's check .AsJSON    
    echo Person1.AsJSON=${Person1.AsJSON}
    ; ==> echo Person1.AsJSON={"first_name":"John","last_name":"Doe"}

    ; Let's get crazy.
    variable person Person2    
    ; We have two people now.

    Person2:SetFromJSON["{\"first_name\":\"Jane\",\"last_name\":\"Doe\"}"]
    
    echo Person2.AsJSON=${Person2.AsJSON}
    ; ==> echo Person2.AsJSON={"first_name":"Jane","last_name":"Doe"}

    ; and hey, we can change Person2 while we're at it
    Person2.FirstName:Set[Shaniqua]

    echo Person2.AsJSON=${Person2.AsJSON}
    ; ==> echo Person2.AsJSON={"first_name":"Shaniqua","last_name":"Doe"}
}
