-- Fix for 3ds Max 2018 - 2019

fn restoreMaterialDisplay =
(
    -- 0x00000241 - REFMSG_NODE_DISPLAY_PROP_CHANGED - maxsdk\include\ref.h
    for i in objects where not i.isHiddenInVpt do
        notifyDependents i partID:#display msg:0x00000241;
)
 
callbacks.addScript #customDisplayFilterChanged "restoreMaterialDisplay()" id:#restoreMaterialDisplay