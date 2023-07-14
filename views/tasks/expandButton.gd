extends Button

var DATA
var can_expand = true
signal expand_journey(nome)
func _ready():
	self.connect("expand_journey", get_parent().get_parent().get_parent(), "expand_journey")
	DATA = get_parent().get_parent().DATA
	if DATA.done == true:
		disabled = true
func _on_Button_pressed():
	if can_expand:
		emit_signal("expand_journey", get_node("../nome").text)
