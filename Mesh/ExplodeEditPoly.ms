fn explodeEPoly obj =
(
    -- Storing frequently used functions in user variables for faster access
    local getNumFaces = polyOp.getNumFaces
    local getElementsUsingFace = polyOp.getElementsUsingFace
    local detachFaces = polyOp.detachFaces
    
    if getNumFaces obj > 0 then
    (
        local element = getElementsUsingFace obj 1
        
        while element.numberset < (getNumFaces obj) do
        (
            detachFaces obj element asNode:true
            element = getElementsUsingFace obj 1
        )
    )
)