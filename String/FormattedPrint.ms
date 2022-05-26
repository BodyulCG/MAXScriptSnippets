fn printf str args =
(
    global __printfMatches
    
    if __printfMatches == undefined then
    (
        local pattern = @"%([-+#0 ]*\d*(?:\.\d+)?(?:l|l32|l64)?[dioucxXeEfgGs])"
        __printfMatches = (dotnetobject "System.Text.RegularExpressions.Regex" pattern).Matches;
    )
    
    local matches = __printfMatches str
    local output = stringstream "" 
    local pos = 1
 
    for i = 1 to matches.count do
    (
        local m = matches.Item[i - 1]
        local g = m.Groups.Item[1]
        local type = m.Groups.item["type"].Value
    
        append output (substring str pos (m.Index + 1 - pos))
        append output (formattedprint args[i] format:g.Value)
 
        pos = m.Index + 1 + m.Length
    )
 
    append output (substring str pos (str.count - pos))
    
    return output as string
)
 
printf "%.5f %s %x %c" #(1.234, "maxscript", 1000, 97)
-- "1.23400 maxscript 3e8 a"