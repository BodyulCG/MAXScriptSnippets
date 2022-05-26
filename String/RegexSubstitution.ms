fn gsub string pattern evaluator =
(
    global __RegexMatch
    
    if __RegexMatch == undefined then 
        __RegexMatch = (dotnetclass "System.Text.RegularExpressions.Regex").Match;
 
    local match = __RegexMatch string pattern
    local result
    local pos = 1
    
    if match.Success then
    (
        local stream = stringstream ""
 
        while match.Success do
        (
            append stream (substring string pos (match.Index + 1 - pos))
            append stream (eval match)
            pos = match.Index + match.Length + 1
            match = match.NextMatch()
        )
 
        if pos < string.count then
            append stream (substring string pos -1);
        
        result = stream as ::string
        free stream
    )
    else result = copy string
    
    return result
)
 
-- Finding and replacing integer decimal numbers with hexadecimal
fn eval match =
    return "0x" + bit.intAsHex (match.Value as integer);
 
gsub "5 a 200 b 500 c" @"\d+" eval
-- 0x5 a 0xc8 b 0x1f4 c