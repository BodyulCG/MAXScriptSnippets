(
    local ContextMenuStrip = dotnetclass "System.Windows.Forms.ContextMenuStrip"
    local ToolStripMenuItem = dotnetclass "System.Windows.Forms.ToolStripMenuItem"
   
    local _contextMenuStrip
    local _pickSubAnimCallback
   
    fn ToolStripMenuItem_Click s e =
    (
        _pickSubAnimCallback s.Tag.Value
       
        if s.HasDropDownItems then
            _contextMenuStrip.Close()
    )
   
    fn subAnimsToMenuItem subanim =
    (      
        local item = dotnetobject ToolStripMenuItem subanim.name
        item.Tag = dotnetmxsvalue subanim
 
        if subanim.numSubs > 0 then
        (
            item.DoubleClickEnabled = true
            dotnet.addEventHandler item "DoubleClick" ToolStripMenuItem_Click
           
            for i = 1 to subanim.numSubs do
            (
                local subitem = subAnimsToMenuItem subanim[i]
                item.DropDownItems.Add subitem
            )
        )
        else dotnet.addEventHandler item "Click" ToolStripMenuItem_Click;
       
        return item
    )
   
    fn applyFilter menuitem filter =
    (
        if menuitem.HasDropDownItems then
        (
            local hasAvailableItems = false
           
            for i = 0 to menuitem.DropDownItems.Count - 1 do
            (
                applyFilter menuitem.DropDownItems.Item[i] filter
 
                if not hasAvailableItems then
                    hasAvailableItems = menuitem.DropDownItems.Item[i].Available
            )
           
            menuitem.Available = hasAvailableItems
            menuitem.DoubleClickEnabled = filter menuitem.Tag.Value
        )
        else menuitem.Available = filter menuitem.Tag.Value
    )
           
    fn pickSubAnim maxwrapperobj callback filter:unsupplied =
    (
        local isMaxWrapper = iskindof maxwrapperobj maxwrapper
        local isMaxScriptFunction = classof callback == maxscriptfunction
 
        if isMaxWrapper and isMaxScriptFunction then
        (
            _contextMenuStrip = dotnetobject ContextMenuStrip
            _pickSubAnimCallback = callback
           
            for i = 1 to maxwrapperobj.numsubs do
                _contextMenuStrip.Items.Add (subAnimsToMenuItem maxwrapperobj[i])
           
            if filter != unsupplied then
                for i = 0 to _contextMenuStrip.Items.Count - 1 do
                    applyFilter _contextMenuStrip.Items.Item[i] filter
           
            _contextMenuStrip.Show mouse.screenpos.x mouse.screenpos.y
        )
    )
   
    /* How to use */

    fn pickCallback subanim =
        print subanim;
   
    fn subAnimFilter subanim =
        return subanim.value != undefined;
   
    pickSubAnim $ pickCallback filter:subAnimFilter
)