extends Node2D

class_name LevelConstruct
@export var height_requiere:int 
@export var zone_to_build:ZoneToBuild
@export var cooldown:int = 3
@export var start_pos:Vector2 
@export var can_go:bool = false

func _ready() -> void:
	$side/height_level.text = str(height_requiere)


func _check()->void:
	$RayCast2D.global_position = start_pos
	can_go = true

func _activate()->void:
	for child:Node in zone_to_build.get_children():
		if child is Piece:
			child._activate()
	$Timer.start(cooldown)


func _process(delta: float) -> void:
	
	
	if can_go and $RayCast2D.is_colliding():
		$RayCast2D.global_position += Vector2(0,300*delta)
	elif not $RayCast2D.is_colliding():
		var dif:float = $RayCast2D.global_position.y - start_pos.y
		if dif < height_requiere: #failure
			pass
		else: #victory
			pass


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()

func _update_score()->void:
	var dif:float = $RayCast2D.global_position.y- start_pos.y
	$side/height_level2.text = str(dif)
