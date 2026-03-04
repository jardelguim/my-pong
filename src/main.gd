extends Node
var screen_size : Vector2 = Vector2(400, 200)
signal game_start_signal

func game_start():
	$Player.position.y = screen_size.y / 2
	$Enemy.position.y = screen_size.y / 2
	$HUD/Message.text = "Press SPACE to start!"
	$Ball.reset_ball()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		emit_signal("game_start_signal")
	pass
