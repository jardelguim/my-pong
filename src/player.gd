extends Node2D
var speed : float = 250
var screen_size : Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity : Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_up") and position.y > 35:
		velocity.y -= 1 
	if Input.is_action_pressed("move_down") and position.y < 165:
		velocity.y += 1 
		
	velocity = velocity.normalized() * speed
	position += velocity * delta
	
	if Input.is_action_pressed("confirm"):
		print(screen_size)
