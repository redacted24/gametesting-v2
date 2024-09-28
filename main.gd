extends Node

func _ready():
	# I'll find a better way of doing this
	$Level1/gem.collected.connect($UI/Label._on_gem_pickup.bind())
	$Level1/gem2.collected.connect($UI/Label._on_gem_pickup.bind())
	$Level1/gem3.collected.connect($UI/Label._on_gem_pickup.bind())

func _process(delta):
	if Input.is_action_just_pressed('reset'):
		get_tree().reload_current_scene()
