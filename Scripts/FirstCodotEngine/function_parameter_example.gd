extends Node

func add(a, b):
	return a + b

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var result = add(3, 5)
	print("합계: ", result)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
