extends VBoxContainer

onready var Journey = preload("res://views/tasks/t.tscn")
var on_display : int
var file_count : int
var dif : int
var SCENE_CRUD = ResourceLoader.load("res://modules/SCENECRUD.tres")
var FILE_CRUD = ResourceLoader.load("res://modules/FILECRUD.tres")
func show_journey(nome):
	print(nome)
	var directory = Directory.new()
	if directory.open("res://data/T/") == OK:
			directory.list_dir_begin()
			var file_name = directory.get_next()
			while file_name != "":
					if !directory.current_is_dir():
							var file_path = "res://data/T/" + file_name
							var hi = Journey.instance()
							var NHR = ResourceLoader.load(file_path)
							hi.DATA = NHR
							if NHR.nome == nome:
								print("KOK")
								add_child(hi)
								on_display += 1
							elif ResourceLoader.load(NHR.parent) != null:
								if ResourceLoader.load(NHR.parent).nome == str(nome):
									hi.get_node("T/pai").text = ResourceLoader.load(NHR.parent).nome
									add_child(hi)
									on_display += 1
					file_name = directory.get_next()
			directory.list_dir_end()



func showjourneys(dif):
		var directory = Directory.new()
		if directory.open("res://data/T/") == OK:
				directory.list_dir_begin()
				var file_name = directory.get_next()
				while file_name != "":
						if !directory.current_is_dir():
								var file_path = "res://data/T/" + file_name
								var hi = Journey.instance()
								var NHR = ResourceLoader.load(file_path)
								hi.DATA = NHR
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

func _ready():
	showjourneys(dif)
func _physics_process(delta):
	FILE_CRUD.count_files_in_folder("res://data/T/")
	if on_display < file_count:
		# Excluir todos os filhos e cria novos
		# ! Muito provavelmente não tão eficiente mas funciona
		for x in range(0, get_children().size()):
			get_child(x).queue_free()
		dif = file_count - on_display
		
func expand_journey(nome):
	print("jojo")
	for x in range(0, get_children().size()):
		get_child(x).queue_free()
	show_journey(nome)

func _on_Button_pressed():
	for x in range(0, get_children().size()):
			get_child(x).queue_free()
	dif = file_count - on_display
	showjourneys(dif)
	


