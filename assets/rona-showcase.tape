Output rona-showcase.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 600
Set Padding 20
Set BorderRadius 8
Set WindowBar Colorful
Set TypingSpeed 60ms
Set Theme "Catppuccin Mocha"

Require ro
Require bat

Hide
Type "export PATH=/opt/homebrew/bin:/Users/tom_planche/.cargo/bin:$PATH"
Enter
Sleep 300ms
Show

Type "ro -g -i"
Sleep 300ms
Enter
Sleep 1.5s

Type "ch"
Sleep 300ms
Enter
Sleep 800ms

Down
Sleep 400ms
Enter
Sleep 500ms

Type "Message décrivant"
Sleep 300ms
Enter
Sleep 300ms

Enter
Sleep 400ms

Type "bat commit_message.md"
Enter
Sleep 2s
