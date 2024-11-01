extends Node2D

@export var speed: float = 200.0  # 노트의 이동 속도
@export var target_position: Vector2 = Vector2(-100, 540) # 목표 위치 (판정선)

func _process(delta):
	# 목표 위치로 이동
	var direction = (target_position - position).normalized()
	position += direction * speed * delta
