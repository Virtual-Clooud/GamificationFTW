extends Resource
class_name PointsRes
export var habit = {"points": 0, "earlybird": 1.0, "bullseye": 1.0, "latenever": 1.0}
export var task = {"points": 0, "earlybird": 1.0, "bullseye": 1.0, "latenever": 1.0}

func get_total_points():
	return ((
		habit["points"] * (habit["earlybird"] + habit["bullseye"] + habit["latenever"])) + (
			task["points"] * (task["earlybird"] + task["bullseye"] + task["latenever"])))
