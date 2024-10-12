extends Node

var InputDict:Dictionary = {} #name:class input

func get_input(InputName:String)->bool:
	""" Get the Input if possible
	Arg:
		InputName:string -> name of the input
	return:
		bool -> If the player pressed and has permission then true  """
	return InputDict[InputName].get_input_pressed()
	
func get_axis(InputArray:Array[String])->int:
	"""   Get the player Movement of an axis
	Arg:
		InputArray:Array[String] -> len() == 2 because it is an axis
	Return:
		int: the new direction
	"""
	
	if InputDict[InputArray[0]].get_access():
		return Input.get_axis(InputArray[0],InputArray[1])
	return 0
	
func get_vector(InputArray:Array[String])->Vector2:
	""" Return the vector corresponding to the movement of the player
	Arg:
		InputArray:Array[String] -> len() == 4 because we want a vector
	Return:
		Vector2 -> the direction vector
	
	"""
	if InputDict[InputArray[0]].get_access():
		return Input.get_vector(InputArray[0],InputArray[1],InputArray[2],InputArray[3])
	return Vector2(0,0)
