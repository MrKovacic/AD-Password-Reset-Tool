#Include <File.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AD.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("AD Password Reset Tool BETA", 509, 276, 250, 152)
$Label1 = GUICtrlCreateLabel("Password Reset Tool", 40, 8, 442, 46)
GUICtrlSetFont(-1, 28, 400, 0, "Arial")
GUICtrlSetColor(-1, 0x000000)
global $rnd, $result2 = ""
$Input3 = GUICtrlCreateInput("", 60, 96, 400, 32, $SS_CENTER)
GUICtrlSetFont(-1, 16, 400, 0, "Arial")
;GUICtrlSetState(-1, $GUI_DISABLE)
$Button1 = GUICtrlCreateButton("Generate Password", 16, 64, 107, 25)
$Button2 = GUICtrlCreateButton("Set Password",260, 162, 75, 25)
$Button3 = GUICtrlCreateButton("Unlock Account", 155, 162, 99, 25)
$Input1 = GUICtrlCreateInput("", 16, 160, 121, 21)
$Group1 = GUICtrlCreateGroup("Account status", 8, 188, 489, 81)
$Label4 = GUICtrlCreateLabel("Username: ", 16, 204, 58, 17)
$Label5 = GUICtrlCreateLabel("Locked: ", 16, 220, 46, 17)
$Label6 = GUICtrlCreateLabel("Password Age:", 16, 236, 75, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label7 = GUICtrlCreateLabel("", 26, 133, 436, 24, $SS_CENTER)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")

GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
_AD_OPEN()

msgbox(0,"FYI","This program will not set any passwords, that portion is not complete. This will only generate a random password and provide you with a NATO readout of the password so you can read it over the phone. I got that far in this application, then lost interest.")


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
		_AD_CLOSE()
			Exit
		Case $Button1
		generate()
		case $Button2
		setpw()
		;case $verify
		;check()
		;case $reset
		;reset()
	EndSwitch
WEnd
#cs
func check()
if GUICtrlRead($Input1) = "" OR GUICtrlRead($Input2) = "" then
GUICtrlSetColor($Label8, 0xFF0000)
GUICtrlSetData($Label8, "Either Employee ID or SS is missing")
GUICtrlSetState($Button1, $GUI_DISABLE)
GUICtrlSetState($Button2, $GUI_DISABLE)
GUICtrlSetState($Button3, $GUI_DISABLE)
return
endif

if GUICtrlRead($Input1) <> GUICtrlRead($Input2) then
GUICtrlSetColor($Label8, 0xFF0000)
GUICtrlSetData($Label8, "Either Employee ID or SS is incorrect")
GUICtrlSetState($Button1, $GUI_DISABLE)
GUICtrlSetState($Button2, $GUI_DISABLE)
GUICtrlSetState($Button3, $GUI_DISABLE)
else
GUICtrlSetColor($Label8, 0x0000FF)
GUICtrlSetData($Label8, "Employee Verified")
GUICtrlSetState($Button1, $GUI_enable)
GUICtrlSetState($Button2, $GUI_enable)
GUICtrlSetState($Button3, $GUI_enable)
endif
endfunc
#ce
func GenSymbol()
$symnum = random(1,7,1)
if $symnum = 1 then Global $symbb = "!"
if $symnum = 2 then Global $symbb = "@"
if $symnum = 3 then Global $symbb = "$"
if $symnum = 4 then Global $symbb = ";"
if $symnum = 5 then Global $symbb = "?"
if $symnum = 6 then Global $symbb = "%"
if $symnum = 7 then Global $symbb = "#"

EndFunc

func generate()
global $rnd = random(1000,9999,1)
global $result = ""
GUICtrlSetData($Input3, $result)
global $Count = _FileCountLines(@scriptdir & "\wordlist.txt")
global $file = FileOpen(@scriptdir & "\wordlist.txt")
global $line = FileReadLine($file, int(random(1, $count)))
GenSymbol()
nato1()


$line = $symbb & $line & $rnd
GUICtrlSetData($Input3, $line)
$rnd2 = stringsplit($rnd, "")
endfunc

func reset()
GUICtrlSetData($Input1, "")
GUICtrlSetData($Input2, "")
GUICtrlSetData($Input3, "")
GUICtrlSetData($Label7, "")
GUICtrlSetState($Button1, $GUI_DISABLE)
endfunc

func nato1()
$myword = $line
symbol($symbb)

$array = StringSplit($myword,"", 1)
for $i = 1 to ubound($array) - 1
$z = nato2($array[$i])
$result = $result & $nato & " "
next


$nums = StringSplit($rnd,"", 1)
for $i = 1 to ubound($nums) - 1
$y = digit($nums[$i])
$result2 = $result2 & $numb & " "
next


$result = $symb & " " & $result & $result2
GUICtrlSetData($Label7, $result)
;GUICtrlSetData($Label8, "")
$result = ""
$result2 = ""
endfunc

func setpw()
If NOT GUICtrlRead($Input3) then
msgbox(0,"Error","You must generate a password first.") 
else
msgbox(0,"Complete","Password has been set. Thank you.") 
endif
endfunc



func nato2($letter)
if $letter = "a" then global $nato = "Alpha"
if $letter = "b" then global $nato = "Bravo"
if $letter = "c" then global $nato = "Charlie"
if $letter = "d" then global $nato = "Delta"
if $letter = "e" then global $nato = "Echo"
if $letter = "f" then global $nato = "Foxtrot"
if $letter = "g" then global $nato = "Golf"
if $letter = "h" then global $nato = "Hotel"
if $letter = "i" then global $nato = "India"
if $letter = "j" then global $nato = "Juliet"
if $letter = "k" then global $nato = "Kilo"
if $letter = "l" then global $nato = "Lima"
if $letter = "m" then global $nato = "Mike"
if $letter = "n" then global $nato = "November"
if $letter = "o" then global $nato = "Oscar"
if $letter = "p" then global $nato = "Papa"
if $letter = "q" then global $nato = "Quebec"
if $letter = "r" then global $nato = "Romeo"
if $letter = "s" then global $nato = "Sierra"
if $letter = "t" then global $nato = "Tango"
if $letter = "u" then global $nato = "Uniform"
if $letter = "v" then global $nato = "Victor"
if $letter = "w" then global $nato = "Whiskey"
if $letter = "x" then global $nato = "X-ray"
if $letter = "y" then global $nato = "Yankee"
if $letter = "z" then global $nato = "Zulu"
return
endfunc

func symbol($sym)
if $sym = "!" then global $symb = "Exclamation-Mark"
if $sym = "@" then global $symb = "At-Sign"
if $sym = "$" then global $symb = "Dollar-Sign"
if $sym = ";" then global $symb = "Semi-Colon"
if $sym = "?" then global $symb = "Question-Mark"
if $sym = "%" then global $symb = "Percent-Sign"
if $sym = "#" then global $symb = "Pound-Sign"
return 
endfunc


func digit($num)
if $num = "1" then global $numb = "One"
if $num = "2" then global $numb = "Two"
if $num = "3" then global $numb = "Three"
if $num = "4" then global $numb = "Four"
if $num = "5" then global $numb = "Five"
if $num = "6" then global $numb = "Six"
if $num = "7" then global $numb = "Seven"
if $num = "8" then global $numb = "Eight"
if $num = "9" then global $numb = "Nine"
if $num = "0" then global $numb = "Zero"

return
endfunc








