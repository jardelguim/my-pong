extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_ball_emit_scores(Player1score : int , Player2score : int, textmsg : String) -> void:
	$Message.show()
	$Message.text = str(textmsg)
	$P1Score.text = str(Player1score)
	$P2Score.text = str(Player2score)

func _on_main_game_start_signal() -> void:
	$Message.hide()

func _on_ball_emit_ball_pos(_ballPos : Vector2 , speed: int) -> void:
	$SpeedLabel.text = str(speed) + " m/s"
