extends Control

func _focus_first_button():
	$Button.grab_focus()  # Atur elemen fokus ke tombol pertama
	
func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	
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
	resume()
	get_tree().change_scene_to_file("res://main_menu.tscn")  # Change to the option control scene
	
func _process(delta):
	testEsc()
