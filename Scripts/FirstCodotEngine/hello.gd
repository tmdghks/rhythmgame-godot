extends Sprite2D

func add(a, b):
	return a + b

func _ready():
	var result = add(3, 5)
	print(result)
