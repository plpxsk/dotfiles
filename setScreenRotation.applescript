use scripting additions

tell application "System Preferences"
	quit
	delay 0.5
	launch
	activate
	set current pane to pane "com.apple.preference.displays"
	--reveal pane id "com.apple.preference.displays"
end tell

delay 2

tell application "System Events"
	tell application process "System Preferences"
		tell window "Displays"
			click button "Display Settings…"
			delay 0.5
			tell sheet 1
				select row 2 of outline 1 of scroll area 1 -- the row with external monitor
				tell pop up button "Rotation:"
					set theRotation to value of it
					click
					tell menu "Rotation:"
						if theRotation = "Standard" then
							click menu item "90°" -- your preferred rotation 
						else
							click menu item "Standard"
						end if
					end tell
				end tell
				delay 1
				if exists of button "Confirm" of sheet 1 then
					click button "Confirm" of sheet 1
				end if
				click button "Done"
			end tell
		end tell
	end tell
end tell

delay 0.5

tell application "System Preferences"
	quit
end tell