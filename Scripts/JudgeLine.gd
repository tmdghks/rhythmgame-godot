extends ColorRect

var judgment_distance: float = 10.0  # 노트와의 거리 기준 (판정 거리)

func check_note_judgment(notes):
	for note in notes:
		if note.position.distance_to(position) <= judgment_distance:
			note_judged(note)

func note_judged(note):
	# 판정이 완료된 노트에 대한 처리
	note.queue_free()  # 노트 제거
	if get_parent():
		get_parent().increase_score()  # 점수 증가
