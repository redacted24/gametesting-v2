extends Label
var gem_count = 0

func _on_gem_pickup():
	gem_count += 1
	text = "Press R to restart level \nGems: %s/3" %gem_count
