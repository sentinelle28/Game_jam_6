extends Node2D



func _on_play_pressed():
	SceneTransition._change_scene("res://Scene/cutscene/cutscene.tscn")

func _process(delta: float) -> void:
	$AnimatedSprite2D.global_position += Vector2(1,0)*delta*100
	if $AnimatedSprite2D.global_position.x > 1208:
		$AnimatedSprite2D.global_position.x = -40
		$AnimatedSprite2D.global_position.y = randf_range(56,576)
