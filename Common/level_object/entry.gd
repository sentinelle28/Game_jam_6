extends Area2D

class_name Entry
@export var path_to_the_level:String
@export var label:Label
@export var is_player_in:bool = false
@export var player:Player

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if player == null:
			player = body
		label.show()
		is_player_in = true


func _on_body_exited(body: Node2D) -> void:
	
	if body is Player:
		label.hide()
		is_player_in = false

func _process(_delta: float) -> void:
	if is_player_in:
		if Input.is_action_pressed("enter"):
			PlayerLocation._set_value(player.global_position)
			SceneTransition._change_scene(path_to_the_level)
