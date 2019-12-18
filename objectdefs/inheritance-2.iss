; objectdefs/11.iss
; inheritance

objectdef appendage
{
    variable string Side
    variable float Inches
    
    member ToText()
    {
        return "${Side.Escape}"
    }
}

objectdef arm inherits appendage
{
    ; everything from appendage is inherited, including Side, Inches, and ToText
}

objectdef leg inherits appendage
{
    ; everything from appendage is inherited, including Side, Inches, and ToText
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

; Below is a shortened version of main() from objectdefs/10.iss
; The point is to show that nothing changed in the way we use the objects, which have changed.
function main()
{
    variable person Person

    ; a Data Sequence begins with an object or variable, such as Person.
    echo ${Person}
    ; ==> echo John Doe

    echo Person.LeftArm.Side=${Person.LeftArm.Side}

    Person.LeftArm.Side:Set[Left]

    ; and we can use any members or methods of string, on Person.LeftArm.Side... such as its "Equal" member
    echo Person.LeftArm.Side.Equal[Left]=${Person.LeftArm.Side.Equal[Left]} 
    ; or we can see how long it is:
    echo Person.LeftArm.Side.Length=${Person.LeftArm.Side.Length} 

}
