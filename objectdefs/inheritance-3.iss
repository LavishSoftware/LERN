; objectdefs/12.iss
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

    ; this time, let's override appendage's ToText by providing it here.
    member ToText()
    {
        return "${Side.Escape} Leg"
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

    echo Person.LeftArm=${Person.LeftArm}
    ; echo Person.LeftArm=Left

    echo Person.LeftLeg=${Person.LeftLeg}
    ; echo Person.LeftArm=Left Leg

    Person.LeftLeg.Side:Set["Prosthetic"]
}
