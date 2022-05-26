fn openFileDialog title:"Open File" filter:"All Files|*.*" multiselect:false =
(
    local dialog = dotnetobject "System.Windows.Forms.OpenFileDialog"
    dialog.title = title
    dialog.filter = filter
    dialog.multiselect = multiselect
   
    local result = undefined
   
    if (dialog.showDialog() == (dotnetclass "System.Windows.Forms.DialogResult").Ok) then
    (
        if multiselect then
            result = dialog.filenames
        else
            result = dialog.filename
    )
 
    dialog.dispose()
 
    return result
)