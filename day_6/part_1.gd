extends Reference


var data: Dictionary = {}
var result: int = 0
var timer: int = 0


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_6/input", File.READ)
	for i in range(9):
		data[i] = 0
	var line_data: PoolStringArray = file.get_line().split(",")
	for number in line_data:
		data[number.to_int()] += 1


func _output_result() -> void:
	print("Day 6 Part 1 result: %d" % result)


func _process_input() -> void:
	var day: int = 0
	while day < 80:
		var new_fish: int = data[timer]
		data[timer] += data[7]
		data[7] = data[8]
		data[8] = new_fish
		timer =  (timer + 1) % 7
		day += 1
	for value in data.values():
		result += value
