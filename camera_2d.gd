extends Camera2D

@onready var player = $"../Player"

@export var SPEED = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = lerp(position,player.position,SPEED*delta)
