extends CheckBox

var DATA
var POINT = ResourceLoader.load("res://data/performance.tres")
var can_expand = true

func _ready():

	DATA = get_parent().get_parent().DATA
	pressed = DATA.done
func cascade_subtasks(nome):
	var directory = Directory.new()
	if directory.open("res://data/T/") == OK:
			directory.list_dir_begin()
			var file_name = directory.get_next()
			while file_name != "":
					if !directory.current_is_dir():
							var file_path = "res://data/T/" + file_name
							var NHR = ResourceLoader.load(file_path)
							if NHR.nome == nome:
								POINT.task["points"] += 50
								ResourceSaver.save(POINT.resource_path, POINT)
							elif ResourceLoader.load(NHR.parent) != null:
								if ResourceLoader.load(NHR.parent).nome == str(nome):
									NHR.done = true
									ResourceSaver.save(NHR.resource_path, NHR)
									POINT.task["points"] += 50
									ResourceSaver.save(POINT.resource_path, POINT)
					file_name = directory.get_next()
			directory.list_dir_end()
func _on_CheckBox_pressed():
	DATA.done = true
	pressed = DATA.done
	cascade_subtasks(DATA.nome)
	ResourceSaver.save(DATA.resource_path, DATA)
