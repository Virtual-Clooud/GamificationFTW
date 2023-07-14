extends Label

export var DATA : Resource
export var Cdata : String
func _ready():
	DATA = get_parent().get_parent().DATA
	text = DATA.nome
