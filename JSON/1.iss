function main()
{
    variable jsonvalue integerValue=1234
    variable jsonvalue numberValue=1.0
    variable jsonvalue stringValue="\"Smooth\""
    variable jsonvalue booleanValue0=false
    variable jsonvalue booleanValue1=true
    variable jsonvalue objectValue="{\"name\":\"apple\",\"color\":\"red\"}"
    variable jsonvalue arrayValue="[1,2,3,4]"
    variable jsonvalue nullValue=null

    echo integerValue[${integerValue.Type}] = ${integerValue}
    echo numberValue[${numberValue.Type}] = ${numberValue}
    echo stringValue[${stringValue.Type}] = "${stringValue~}"
    echo booleanValue0[${booleanValue0.Type}] = ${booleanValue0}
    echo booleanValue1[${booleanValue1.Type}] = ${booleanValue1}
    echo objectValue[${objectValue.Type}] = "${objectValue~}"
    echo arrayValue[${arrayValue.Type}] = "${arrayValue~}"
    echo nullValue[${nullValue.Type}] = ${nullValue}
}
