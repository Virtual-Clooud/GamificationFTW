extends Label

var DATA

func _ready():
	DATA = get_parent().get_parent().DATA
	var P = ResourceLoader.load(DATA.child)
	if P != null:
		text = ResourceLoader.load(DATA.child).nome
	
