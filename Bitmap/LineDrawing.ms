fn drawLine bmp x0 y0 x1 y1 color:white =
(
    local dx = x1 - x0
    local dy = y1 - y0
    local col = #(color)
            
    if abs dx > abs dy then
    (
        local step = dy / float dx
        for x = x0 to x1 by (if dx > 0 then 1 else -1) do
            setPixels bmp [x, y0 + step * (x - x0) + 0.5] col;
    )
    else
    (
        local step = dx / float dy
        for y = y0 to y1 by (if dy > 0 then 1 else -1) do
            setPixels bmp [x0 + step * (y - y0) + 0.5, y] col;
    )
)

-- Example
(
    local bmp = bitmap 500 500 color:black
    
    for i = 1 to 120 do
    (
        local x1 = random 0 500
        local y1 = random 0 500
        local x2 = random 0 500
        local y2 = random 0 500
        local col = random black white
        
        drawLine bmp x1 y1 x2 y2 color:col
    )
    display bmp
)