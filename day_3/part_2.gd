extends Reference


var data: Array = []
var oxygen_rating: Array = []
var co2_rating: Array = []
var counters: Array = []
var result: int = 0


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_3/input", File.READ)
	var line: String = file.get_line()
	while line != "":
		data.push_back(line)
		line = file.get_line()


func _output_result() -> void:
	print("Day 3 Part 2 result: %d" % result)


func _process_input() -> void:
	# Determine oxygen generator rating
	var temp: Array = data.duplicate()
	var mid_point: int = (temp.size() + 1) / 2
	counters = _count_array(data)
	for i in range(counters.size()):
		temp = _filter_array(temp, counters[i] >= mid_point, i)
		if temp.size() == 1:
			break;
		mid_point = (temp.size() + 1) / 2
		counters = _count_array(temp)
	for c in temp[0]:
		oxygen_rating.push_back(c.to_int())

	# Determine CO2 scrubber rating
	temp = data.duplicate()
	mid_point = (temp.size() + 1) / 2
	counters = _count_array(data)
	for i in range(counters.size()):
		temp = _filter_array(temp, counters[i] < mid_point, i)
		if temp.size() == 1:
			break;
		mid_point = (temp.size() + 1) / 2
		counters = _count_array(temp)
	for c in temp[0]:
		co2_rating.push_back(c.to_int())

	result = _binary_to_decimal(oxygen_rating) * _binary_to_decimal(co2_rating)


func _count_array(array: Array) -> Array:
	var new_array: Array = []
	for value in array[0]:
		new_array.push_back(0)
	for value in array:
		for i in range(value.length()):
			new_array[i] += value[i].to_int()
	return new_array


func _filter_array(array: Array, keep_ones: bool, position: int) -> Array:
	var new_array: Array = []
	for value in array:
		if keep_ones and value[position] == "1":
			new_array.push_back(value)
		if not keep_ones and value[position] == "0":
			new_array.push_back(value)
	return new_array


func _binary_to_decimal(binary: Array) -> int:
	binary.invert()
	var decimal_value: int = binary[0]
	for i in range(1, binary.size()):
		decimal_value += binary[i] * pow(2, i)
	return decimal_value
