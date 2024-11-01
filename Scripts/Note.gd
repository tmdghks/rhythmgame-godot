extends Node2D

@export var speed: float = 200.0  # 노트의 이동 속도 (픽셀/초)
var target_position: Vector2  # 목표 위치 (판정선)

func _process(delta):
	# 현재 위치에서 목표 위치를 향해 이동
	var direction = (target_position - position).normalized()
	position += direction * speed * delta

	# 판정선에 도달하면 제거
	if position.distance_to(target_position) < 10:
		queue_free()
