extends HSlider


func _on_value_changed(value: float) -> void:
	GlobalWorldEnvironment.environment.adjustment_brightness = value
	


func _on_button_pressed() -> void:
	pass # Replace with function body.
