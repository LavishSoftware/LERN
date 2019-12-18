; objectdefs/10.iss
; this isn't actually the tenth objectdef example, I picked a number. deal with it.


objectdef arm
{
    variable string Side
    variable float Inches

    member ToText()
    {
        return "${Side.Escape}" 
    }
}

objectdef leg
{
    variable string Side
    variable float Inches

    member ToText()
    {
        return "${Side.Escape}" 
    }
}

objectdef person
{
    variable string FirstName="John"
    variable string LastName="Doe"

    variable arm LeftArm
    variable arm RightArm

    variable leg LeftLeg
    variable leg RightLeg

    method Initialize()
    {
        LeftArm.Side:Set[Left]
        RightArm.Side:Set[Right]

        LeftLeg.Side:Set[Left]
        RightLeg.Side:Set[Right]
    }

    member ToText()
    {
        return "${FirstName.Escape} ${LastName.Escape}"
    }
}

function main()
{
    variable person Person

    ; a Data Sequence begins with an object or variable, such as Person.
    echo ${Person}
    ; ==> echo John Doe

    ; Person, a person object, has other objects related to it. 
    ; ... it has variables (FirstName, LastName, etc)
    ; ... and it has members, such as ToText, which returns a string object
    
    ; the object's members and variables are accessed the same way in a Data Sequence:
    echo a member... Person.ToText=${Person.ToText}
    ; ==> echo a member... Person.ToText=John Doe
    echo a variable... Person.FirstName=${Person.FirstName}
    ; ==> echo a variable... Person.FirstName=John

    ; Person.ToText and Person.FirstName are both string objects. That is, FirstName is a string variable, and Person.ToText is a member that returns a string.
    
    ; string has many members and methods defined internally in LavishScript. string has a Set method, which sets the value of the string.
    
    ; but we can't do this...
    FirstName:Set[Jack]    
    ; because in this context, there is no FirstName. 
    
    ; and we can't do this...
    Person:Set[Jack]
    ; because the person objectdef does not provide a Set method
        
    ; we specifically want to use Set on the FirstName variable which is part of Person, which we know we can output with ${Person.FirstName}
    Person.FirstName:Set[Jack]


    ; furthermore, if objects are nested deeper, the Data Sequence can continue to the right, accessing further members/variables to arrive at the desired value.
    echo Person.LeftArm.Side=${Person.LeftArm.Side}

    ; Side is, again, a string Variable. string has a Set method, but neither "person" nor "arm" have a Set method
    ; so this doesn't work...
    Side:Set[Left]
    ; because in this context there is no Side

    ; and this doesn't work ...
    Person.LeftArm:Set[Left]
    ; because arm does not have a Set method

    ; but the following will Set the Side variable that is part of Person.LeftArrm:
    Person.LeftArm.Side:Set[Left]


    ; and we can use any members or methods of string, on Person.LeftArm.Side... such as its "Equal" member
    echo Person.LeftArm.Side.Equal[Left]=${Person.LeftArm.Side.Equal[Left]} 
    ; or we can see how long it is:
    echo Person.LeftArm.Side.Length=${Person.LeftArm.Side.Length} 

}