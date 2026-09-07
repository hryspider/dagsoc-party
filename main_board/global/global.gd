extends Node

const PLAYER_COLOURS = [
	Color("F27C6F"),
	Color("28AAD4"),
	Color("F8FF57"),
	Color("523FB0")
]

var player_faces : Array[FaceData]= [FaceData.new(), FaceData.new(), FaceData.new(), FaceData.new()]
var player_positions = [0,0,0,0]

var rankings = []


func set_rankings(ranks : Array[int]):
	rankings = []
	if len(ranks) != 4: return
	var seen = []
	for i in ranks:
		if i in seen or i < 0 or i > 3: return
		seen.append(i)
	rankings = ranks
