extends CharacterBody2D

@export var speed:int = 300
var last_direction:Vector2 = Vector2(1,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move(delta)
	move_and_slide()


func _move(delta:float)->void:
	var direction:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if direction != Vector2.ZERO:
		velocity += direction*speed*delta
		last_direction = Vector2(custom_clamp(direction.x),custom_clamp(direction.y))
		$AnimationTree["parameters/playback"].travel("walk")
		$AnimationTree["parameters/walk/blend_position"] = last_direction
	else:
		$AnimationTree["parameters/playback"].travel("idle")
		velocity.x = lerp(velocity.x,0.0,delta*10)
		velocity.y = lerp(velocity.y,0.0,delta*10)
		$AnimationTree["parameters/idle/blend_position"] = last_direction
	velocity.x = clampf(velocity.x,-1000,1000)
	velocity.y = clampf(velocity.y,-1000,1000)
	
func custom_clamp(value:float)->int:
	if value < 0:
		return -1
	elif value > 0:
		return 1
	else:
		return 0
