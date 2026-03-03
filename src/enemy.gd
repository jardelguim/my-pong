extends Node2D
const maxY = 25
const minY = 175
var speed : float = 250

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity : Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("p2move_up") and position.y > 35:
		velocity.y -= 1 
	if Input.is_action_pressed("p2move_down") and position.y < 165:
		velocity.y += 1 
		
	velocity = velocity.normalized() * speed
	position += velocity * delta
	

func _on_ball_emit_ball_pos(ballPos : Vector2) -> void:
	# position.y = ballPos.y - 2
	pass # Replace with function body.
