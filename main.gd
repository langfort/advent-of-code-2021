extends Node2D


var day_1_part_1 = load("res://day_1/part_1.gd").new()
var day_1_part_2 = load("res://day_1/part_2.gd").new()
var day_2_part_1 = load("res://day_2/part_1.gd").new()
var day_2_part_2 = load("res://day_2/part_2.gd").new()


func _ready() -> void:
	day_1_part_1.start()
	day_1_part_2.start()

	day_2_part_1.start()
	day_2_part_2.start()
