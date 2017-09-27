with(o_control)
{
    url = global.server+string(argument0);
    get = http_get(url)
}
