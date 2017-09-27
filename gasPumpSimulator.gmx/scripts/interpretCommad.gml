var input = string_lower(argument0)


if(connectedTo == -1)
{
    return phoneOS(input);
}
else
{
    if(instance_exists(connectedTo))
    {
        input = string_replace_all(input,string_lower(string(connectedTo.name)),string(connectedTo.idd))
        netread(input)
    }
    else
    {
        println("Lost Connection")
        connectedTo = -1; // instance doesnt exist, dissconnected
    }
    return "";
}

