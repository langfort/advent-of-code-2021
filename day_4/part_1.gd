extends Reference


var data: Array = []
var number_map: Dictionary = {}
var result: int = 0
var call_numbers: Array = []


func _ready() -> void:
	pass


func start() -> void:
	_load_input()
	_process_input()
	_output_result()


func _load_input() -> void:
	var file: File = File.new()
	file.open("res://day_4/input", File.READ)
	var numbers: PoolStringArray = file.get_line().split(",")
	for number in numbers:
		call_numbers.push_back(number.to_int())
	var y: int = 0
	while file.get_position() < file.get_len():
		file.get_line() # Discard blank line
		for i in range(5):
			numbers = file.get_line().split(" ", false)
			var row: Array = []
			var x: int = 0
			for number_string in numbers:
				var number: int = number_string.to_int()
				row.push_back({
					"number": number,
					"called": false,
					})
				if not number_map.has(number):
					number_map[number] = []
				number_map[number].push_back(Vector2(x, y))
				x += 1
			data.push_back(row)
			y += 1


func _output_result() -> void:
	print("Day 4 Part 1 result: %d" % result)


func _process_input() -> void:
	for number in call_numbers:
		if number_map.has(number):
			for entry in number_map[number]:
				data[entry.y][entry.x].called = true
				if _check_win(entry):
					_calculate_score(entry, number)
					return


func _check_win(position: Vector2) -> bool:
	var start_y: int = floor(position.y / 5) * 5
	var count: int = 0

	# Check row
	for x in range(5):
		if data[position.y][x].called == true:
			count += 1
	if count == 5:
		return true
	count = 0

	# Check column
	for y in range(start_y, start_y + 5):
		if data[y][position.x].called == true:
			count += 1
	return count == 5


func _calculate_score(position: Vector2, number: int) -> void:
	var start_y: int = floor(position.y / 5) * 5
	for y in range(start_y, start_y + 5):
		for x in range(5):
			if not data[y][x].called:
				result += data[y][x].number
	result *= number
