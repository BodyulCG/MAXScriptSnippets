fn isLinearSegment shape spline segment threshold:0.00001 =
(
	local isLinear = false
	
    if getSegmentType shape spline segment == #Curve then
    (
        local A = getKnotPoint shape spline segment
        local B = getOutVec shape spline segment
        local C = getInVec shape spline (segment + 1)
        local D = getKnotPoint shape spline (segment + 1)
        local v1 = normalize (B - A)
        local v2 = normalize (C - D)
        local curvature = (dot v1 v2) / 2 + 0.5
 
        isLinear = curvature <= threshold
    )
    
	return isLinearSegment
)