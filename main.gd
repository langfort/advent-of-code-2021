extends Node2D


var Day1Part1 := preload("res://day_1_sonar_sweep/day_1_part_1.gd")
var Day1Part2 := preload("res://day_1_sonar_sweep/day_1_part_2.gd")
var Day2Part1 := preload("res://day_2_dive/day_2_part_1.gd")
var Day2Part2 := preload("res://day_2_dive/day_2_part_2.gd")

var day_1_part_1 := Day1Part1.new()
var day_1_part_2 := Day1Part2.new()
var day_2_part_1 := Day2Part1.new()
var day_2_part_2 := Day2Part2.new()


func _ready() -> void:
	day_1_part_1.start()
	day_1_part_2.start()

	day_2_part_1.start()
	day_2_part_2.start()
