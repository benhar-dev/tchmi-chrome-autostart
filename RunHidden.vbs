Cmd = ""

for argNo = 2 to wScript.arguments.count
Cmd = Cmd & " " & """" & wScript.arguments(argNo-1) & """"
next

CreateObject("Wscript.Shell").Run "" & WScript.Arguments(0) & " " & Cmd, 1, False