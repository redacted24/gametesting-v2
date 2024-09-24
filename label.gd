extends Label
var gem_count = 0

func _on_gem_pickup():
	gem_count += 1
	text = "Gems: %s" %gem_count
