# AppleScript for Demo Window layout
# on mac - execute with `osascript window_layout.scpt` (iterm required)
# on Windows - do something different...

tell application "iTerm"
	activate
	tell current window
		create tab with default profile
	end tell
	set pane_1 to (current session of current window)

	tell pane_1
		set pane_3 to (split horizontally with same profile)
	end tell

	tell pane_1
		set pane_2 to (split vertically with same profile)
	end tell

	tell pane_1
		write text "cd ~/Projects/nso-vlan"

	end tell

	tell pane_2
		write text "cd ~/Projects/nso-vlan"
	end tell

	tell pane_3
		write text "cd ~/Projects/nso-vlan"
	end tell

end tell
