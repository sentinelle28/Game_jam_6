extends Node

var value:Vector2 = Vector2(229,260)

func _set_value(new_value:Vector2)->void:
	value = new_value
	
func get_value()->Vector2:
	return value
