extends RigidBody2D

class_name Piece

var is_colliding:bool = false

func _activate()->void:
	freeze = false
	


func _on_body_entered(body: Node) -> void:
	if body is Piece:
		is_colliding = true


func _on_body_exited(body: Node) -> void:
	if body is Piece:
		is_colliding = false

func colliding()->bool:
	return is_colliding
