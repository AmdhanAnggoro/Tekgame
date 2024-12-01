extends Control

func _ready():
	_focus_first_button()  # Set initial focus to the first button

func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().is_paused():
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().is_paused():
		resume()

func _on_resume_pressed():
	resume()

func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")  # Change to the option control scene
	
func _process(delta):
	testEsc()
	handle_menu_navigation()

func handle_menu_navigation():
	if Input.is_action_just_pressed("ui_down"):
		_focus_next_button(1)  # Move to the next button
	elif Input.is_action_just_pressed("ui_up"):
		_focus_next_button(-1)  # Move to the previous button
	elif Input.is_action_just_pressed("ui_accept"):
		# Trigger the pressed signal on the focused button
		var focused_button = _get_current_focus()
		if focused_button and focused_button is Button:
			focused_button.emit_signal("pressed")

# Helper function to navigate buttons
func _focus_next_button(direction):
	var buttons = $PanelContainer/VBoxContainer.get_children()
	var focused_index = buttons.find(_get_current_focus())
	var next_index = (focused_index + direction) % buttons.size()
	buttons[next_index].grab_focus()

# Helper function to get the currently focused button
func _get_current_focus():
	var buttons = $PanelContainer/VBoxContainer.get_children()
	for button in buttons:
		if button is Button and button.has_focus():
			return button
	return null

# Helper function to set focus to the first button
func _focus_first_button():
	var buttons = $PanelContainer/VBoxContainer.get_children()
	for button in buttons:
		if button is Button:
			button.grab_focus()
			break
