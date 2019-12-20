function main()
{
    ; an index is a dynamic array. creating a variable requires a sub-type specified by index:subtypename, like this:
    variable index:int IntegerList

    ; adding items to the next open position is done with Insert
    IntegerList:Insert[17]
    IntegerList:Insert[42]
    IntegerList:Insert[35]
    IntegerList:Insert[9000]

    ; index.AsJSON will produce a JSON array
    echo ${IntegerList.AsJSON}
    ; ==> [17,42,35,9000]
}