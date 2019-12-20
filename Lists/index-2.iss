function main()
{
    variable index:int IntegerList

    IntegerList:Insert[17]
    IntegerList:Insert[42]
    IntegerList:Insert[35]
    IntegerList:Insert[9000]

    ; we can access individual items in the list with the Data Sequence index [] syntax
    
    ; this will echo the value of the 3rd item, which we know from above is 35
    echo ${IntegerList[3]}
    ; ==> 35

    ; Removing items from an index is done with :Remove[#] where # indicates the Nth (1-based) position in the index

    ; this will remove the 3rd item, which we know from above is 35.
    IntegerList:Remove[3]

    ; because we just used Remove on 3, this will be NULL
    echo ${IntegerList[3]}
    ; ==> NULL

    ; Insert will now re-use the open position 3. we can put 35 back where it was.
    IntegerList:Insert[35]
    
    echo ${IntegerList[3]}
    ; ==> 35


    ; index.AsJSON will produce a JSON array
    echo ${IntegerList.AsJSON}
    ; ==> [17,42,35,9000]
}