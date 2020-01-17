function main(string parameter="\"Hello World!\"")
{
    variable jsonvalue userValue
    userValue:SetValue["${parameter~}"]

    echo userValue[${userValue.Type}] = "${userValue~}"
}