fn colorToInt color =
    return (bit.shift (integer color.r) 16) + (bit.shift (integer color.g) 8) + integer color.b;
 
fn intToColor integer =
    return color \
        (bit.and (bit.shift integer -16) 255) \
        (bit.and (bit.shift integer -8) 255) \
        (bit.and integer 255);