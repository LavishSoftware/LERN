function main()
{
    variable jsonvalue jo="{\"x\":100.0}"
    echo ${jo}

    echo ${jo.Get[x]}
    ; jo.Get[x] is a float64 containing 100.00000000000
    ; float64 has no .Escape
;    echo ${jo.Get[x].Escape}
;   echo ==> NULL

    

}