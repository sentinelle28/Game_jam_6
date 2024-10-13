extends Area2D

class_name Entry
@export var path_to_the_level:String


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if Input.is_action_pressed("enter"):
			PlayerLocation._set_value(body.global_position)
			SceneTransition._change_scene(path_to_the_level)
