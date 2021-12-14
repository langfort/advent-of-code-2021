extends Node2D


var day_1_part_1 = load("res://day_1/part_1.gd").new()
var day_1_part_2 = load("res://day_1/part_2.gd").new()
var day_2_part_1 = load("res://day_2/part_1.gd").new()
var day_2_part_2 = load("res://day_2/part_2.gd").new()
var day_3_part_1 = load("res://day_3/part_1.gd").new()
var day_3_part_2 = load("res://day_3/part_2.gd").new()
var day_4_part_1 = load("res://day_4/part_1.gd").new()
var day_4_part_2 = load("res://day_4/part_2.gd").new()
var day_5_part_1 = load("res://day_5/part_1.gd").new()
var day_5_part_2 = load("res://day_5/part_2.gd").new()
var day_6_part_1 = load("res://day_6/part_1.gd").new()
var day_6_part_2 = load("res://day_6/part_2.gd").new()
var day_7_part_1 = load("res://day_7/part_1.gd").new()
var day_7_part_2 = load("res://day_7/part_2.gd").new()


func _ready() -> void:
	day_1_part_1.start()
	day_1_part_2.start()

	day_2_part_1.start()
	day_2_part_2.start()

	day_3_part_1.start()
	day_3_part_2.start()

	day_4_part_1.start()
	day_4_part_2.start()

	day_5_part_1.start()
	day_5_part_2.start()

	day_6_part_1.start()
	day_6_part_2.start()

	day_7_part_1.start()
	day_7_part_2.start()
