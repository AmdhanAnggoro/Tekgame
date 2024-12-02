extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://map_lv_1.tscn")  # Change to the option control scene


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settingmenu.tscn")  # Change to the option control scene


func _on_exit_pressed():
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Creidt.tscn")
