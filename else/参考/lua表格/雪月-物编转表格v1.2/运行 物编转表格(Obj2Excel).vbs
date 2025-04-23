Set args = WScript.Arguments
arg = ""

For Each cmd In args
    arg = arg & cmd
Next

WScript.CreateObject("WScript.Shell").Run ".\\run"