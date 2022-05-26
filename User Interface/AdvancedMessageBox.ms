fn MessageBoxEx message caption:"Message" buttons:#OK icon:#Information =
(
    local MsgBox = dotnetclass "System.Windows.Forms.MessageBox"
    local MessageBoxButtons = dotnetclass "System.Windows.Forms.MessageBoxButtons"
    local MessageBoxIcon = dotnetclass "System.Windows.Forms.MessageBoxIcon"
    local DialogResult = dotnetclass "System.Windows.Forms.DialogResult"
    
    local _buttons = case buttons of
    (
        #AbortRetryIgnore: MessageBoxButtons.AbortRetryIgnore
        #OK: MessageBoxButtons.OK
        #OKCancel: MessageBoxButtons.OKCancel
        #RetryCancel: MessageBoxButtons.RetryCancel
        #YesNo: MessageBoxButtons.YesNo
        #YesNoCancel: MessageBoxButtons.YesNoCancel
    )
    
    local _icon = case icon of
    (
        #Asterisk: MessageBoxIcon.Asterisk
        #Error: MessageBoxIcon.Error
        #Exclamation: MessageBoxIcon.Exclamation
        #Hand: MessageBoxIcon.Hand
        #Information: MessageBoxIcon.Information
        #None: MessageBoxIcon.None
        #Question: MessageBoxIcon.Question
        #Stop: MessageBoxIcon.Stop
        #Warning: MessageBoxIcon.Warning
    )
    
    local result = case MsgBox.Show message caption _buttons _icon of
    (
        (DialogResult.Abort): #Abort
        (DialogResult.Cancel): #Cancel
        (DialogResult.Ignore): #Ignore
        (DialogResult.No): #No
        (DialogResult.None): #None
        (DialogResult.OK): #OK
        (DialogResult.Retry): #Retry
        (DialogResult.Yes): #Yes
    )
    
    return result
)