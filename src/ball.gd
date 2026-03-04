extends Node2D
# Variables

var screen_size : Vector2
@export var speed : float = 200
var isBallRunning : bool = false
var direction
var textmsg : String
var ballPos : Vector2
signal emit_scores
signal emit_ballPos
# Scores

var Player1score : int = 0
var Player2score : int = 0

func reset_ball():
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
	speed = 200
	isBallRunning = false
	
func random_pong_direction():
	# Randomizes angle and side
	var angle = randf_range(-0.5 , 0.5)
	var side = [-1, 1].pick_random()
	# Creates a Vector2 variable with both randomized values ( d ).
	var d = Vector2(side, angle)
	return d.normalized()
	
func _ready() -> void:
	screen_size = get_viewport_rect().size
	reset_ball()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isBallRunning:
		$BallArea/BallSprite.rotate(1)
		ballPos = position
		position += direction * speed * delta

func _on_ball_area_area_entered(area: Area2D) -> void:
	# Sound player
	var soundlist = [$"../Tap1",$"../Tap2"]
	var soundplayed
	# Wall Collisions
	if area.name == "LeftWall" or area.name == "RightWall":
		direction.x = direction.x * -1
	if area.name == "LeftWall":
		Player2score += 1
		textmsg = "Player 2 Scores 1 point!"
		emit_signal("emit_scores", Player1score, Player2score, textmsg)
		$"../Win".play()
		$Trail.hide()
		reset_ball()
	if area.name == "LeftWallCenter":
		Player2score += 3
		textmsg = "Player 2 Scores 3 points!"
		emit_signal("emit_scores", Player1score, Player2score, textmsg)
		$"../Win".play()
		$Trail.hide()
		reset_ball()
	if area.name == "RightWall":
		Player1score += 1
		textmsg = "Player 1 Scores 1 point!"
		emit_signal("emit_scores", Player1score, Player2score, textmsg)
		$"../Win".play()
		$Trail.hide()
		reset_ball()
	if area.name == "RightWallCenter":
		Player1score += 3
		textmsg = "Player 1 Scores 3 points!"
		emit_signal("emit_scores", Player1score, Player2score, textmsg)
		$"../Win".play()
		$Trail.hide()
		reset_ball()
	if area.name == "UpWall" or area.name == "DownWall":
		direction.y = direction.y * -1
		soundplayed = soundlist.pick_random()
		soundplayed.play()
	# Player Collisions
	if area.name =="PlayerArea" or area.name == "EnemyArea":
		direction.x = direction.x * -1
		direction.y = direction.y + randf_range(-0.5 , 0.5)
		speed += speed * 0.04
		emit_signal("emit_ballPos" , ballPos, speed)
		soundplayed = soundlist.pick_random()
		soundplayed.play()

func _on_main_game_start_signal() -> void:
	direction = random_pong_direction()
	$Trail.show()
	isBallRunning = true
