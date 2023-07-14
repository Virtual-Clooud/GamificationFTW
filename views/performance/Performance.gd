extends Control

export var pointsResource : Resource
func _ready():
	$ColorRect/Label.text = str(pointsResource.get_total_points())
	if Time.get_date_dict_from_system()["weekday"] != 6:
		$ColorRect/Label.text = "?????"
	else:
		$ColorRect/Label.text = str(pointsResource.get_total_points())
	if Time.get_date_dict_from_system()["weekday"] != 7:
		pointsResource.habits["points"] = 0
		pointsResource.task["points"] = 0

