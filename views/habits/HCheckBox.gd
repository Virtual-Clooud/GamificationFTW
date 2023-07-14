extends CheckBox

export var DATA : Resource
export var Cdata : String
func _ready():
	DATA = get_parent().get_parent().DATA
	if Time.get_date_dict_from_system()["year"] + Time.get_date_dict_from_system()["month"] + Time.get_date_dict_from_system()["day"] != DATA.last_check["year"] + DATA.last_check["month"] + DATA.last_check["day"]:
		DATA.done = false
		ResourceSaver.save(DATA.resource_path, DATA)
	pressed = DATA.done
func _on_CheckBox_pressed():
	var point = ResourceLoader.load("res://data/performance.tres")
	
	DATA.done = true
	
	point.habit["points"] += 50
	if int(Time.get_time_dict_from_system()["hour"]) + int(Time.get_time_dict_from_system()["minute"]) < int(DATA.time["H"]) + int(DATA.time["M"]):
		point.habit["latenever"] += 2
	elif int(Time.get_time_dict_from_system()["hour"]) + int(Time.get_time_dict_from_system()["minute"]) > int(DATA.time["H"]) + int(DATA.time["M"]):
		point.habit["earlybird"] += 2
	else:
		point.habit["bullseye"] += 2
	DATA.last_check = Time.get_date_dict_from_system()
	ResourceSaver.save(point.resource_path, point)
	ResourceSaver.save(DATA.resource_path, DATA)
func _physics_process(delta):
	if pressed == true:
		disabled = true
