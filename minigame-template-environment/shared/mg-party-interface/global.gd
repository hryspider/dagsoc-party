extends Node

const PLAYER_COLOURS = [
	Color("F27C6F"),
	Color("28AAD4"),
	Color("F8FF57"),
	Color("523FB0")
]

var player_faces : Array[FaceData]= [FaceData.new(), FaceData.new(), FaceData.new(), FaceData.new()]


signal minigame_finished(rankings: Array[int])
signal minigame_failed(message: String)


# func set_rankings(ranks : Array[int]):
# 	rankings = []
# 	if len(ranks) != 4: return
# 	var seen = []
# 	for player in ranks:
# 		if player in seen:
# 			print(ranks)
# 			#fail_test('repeated player in the rankings')
# 			print('repeated player in the rankings')
# 			return
# 		if player < 0 or player > 3:
# 			print(ranks)
# 			#fail_test('not defined player in the rankings')
# 			print('not defined player in the rankings')
# 			return
# 		seen.append(player)
# 	rankings = ranks

func end_minigame(ranks : Array[int]):
	var seen = []
	for player in ranks:
		if player in seen:
			print(ranks)
			#fail_test('repeated player in the rankings')
			print('ERROR: repeated player in the rankings')
			return
		if player < 0 or player > 3:
			print(ranks)
			#fail_test('not defined player in the rankings')
			print('ERROR: not defined player in the rankings')
			return
		seen.append(player)
	
	minigame_finished.emit(ranks.duplicate())
	#Transition.transition_to("res://main_board/rooms/results.tscn")
