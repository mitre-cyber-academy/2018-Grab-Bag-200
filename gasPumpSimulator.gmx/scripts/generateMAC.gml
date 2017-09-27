var tempMac = "";

str = base64_encode(argument0);
hash = md5_string_unicode(str);

c = 1;
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=":";
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=":";
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=":";
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=":";
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=":";
tempMac+=string_char_at(hash,c); c+=1;
tempMac+=string_char_at(hash,c); c+=1;

tempMac = string_upper(tempMac)
return tempMac;
