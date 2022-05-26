fn shuffle arr =
(
    local num = arr.count
    local j
 
    for i = 1 to num do
    (
        j = random 1 num
        swap arr[i] arr[j]
    )
 
    return arr
)