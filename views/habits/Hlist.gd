extends VBoxContainer

onready var habitS = preload("res://views/habits/H.tscn")
var on_display : int
var file_count : int
var dif : int
func getFileCountInFolder(folder_path: String) -> int:
		file_count = 0
		var directory = Directory.new()
		if directory.open(folder_path) == OK:
				directory.list_dir_begin()
				var file_name = directory.get_next()
				while file_name != "":
						if !directory.current_is_dir():
								file_count += 1
						file_name = directory.get_next()
				directory.list_dir_end()
		return file_count

func makehabit(dif):
		var directory = Directory.new()
		if directory.open("res://data/H/") == OK:
				directory.list_dir_begin()
				var file_name = directory.get_next()
				while file_name != "":
						if !directory.current_is_dir():
								var file_path = "res://data/H/" + file_name
								var hi = habitS.instance()
								var NHR = ResourceLoader.load(file_path)
								hi.DATA = NHR
								hi.get_node("Panel/nome").DATA = NHR
								hi.get_node("Panel/done").DATA = NHR
								hi.get_node("Panel/tempo").DATA = NHR
								add_child(hi)
								on_display += 1
						file_name = directory.get_next()
				directory.list_dir_end()
func list_by_time(type):
	if type == 0:
		var valmax = 0000
		var pos = get_children().size()
		for x in range(0, get_children().size()):
			
			print("VALMAX" + str(valmax))
			if get_child(x).DATA.get_time_as_int() > valmax:
				print("THIS IS MAX" + str(get_child(x).DATA.get_time_as_int()))
				move_child(get_child(x), get_children().size())
				valmax = get_child(x).DATA.get_time_as_int()
			else:
				pos -= 1
				move_child(get_child(x), pos)
	if type == 1:
		pass


func _physics_process(delta):
	getFileCountInFolder("res://data/H/")
	if on_display < file_count:
		# Excluir todos os filhos e cria novos
		# ! Muito provavelmente não tão eficiente mas funciona
		for x in range(0, get_children().size()):
			get_child(x).queue_free()
		dif = file_count - on_display
		makehabit(dif)

func _on_Button_pressed():
	list_by_time(0)
