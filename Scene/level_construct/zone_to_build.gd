extends Area2D

class_name ZoneToBuild

func _add_child(node:Piece)->void:
	node.reparent(self)
