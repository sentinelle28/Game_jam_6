extends Panel

class_name Inventory

func _add_child(node:Piece)->void:
	node.reparent(self)
	_positionate(node)
	
func _positionate(node:Piece)->void:
	if get_child_count() > 1:
		node.global_position = get_child(-2).global_position + Vector2(50,0)
	else:
		node.global_position = Vector2(50,580)
		
