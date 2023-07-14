extends Label

var DATA

func _ready():
	DATA = get_parent().get_parent().DATA
	text =  DATA.date["D"] + DATA.date["M"] + DATA.date["A"]
