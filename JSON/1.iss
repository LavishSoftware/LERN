function main()
{
    echo -----------------
    echo JSON/1.iss begins
    echo -----------------
    
    variable jsonvalue value
    ; variable jsonvalue value="{\"first_name\":\"John\",\"last_name\":\"Doe\"}"

    ; "type" is a special object type    
    echo value(type)=${value(type)} value.Type=${value.Type}
    ; ==> echo value(type)=jsonvaluecontainer value.Type=NULL

    lstype ${value(type)}

    echo value:SetValue[{}]
    value:SetValue[{}]
    echo value.Type=${value.Type}
    ; echo value.Type=object

;    value:Set["first_name","\"John\""]

;    value:SetValue["{\"first_name\":\"John\",\"last_name\":\"Doe\"}"]

    lstype jsonobject

    echo value:SetValue["[]"]
    value:SetValue["[]"]

    echo value.Type=${value.Type}
    ; echo value.Type=array

    lstype jsonarray

}