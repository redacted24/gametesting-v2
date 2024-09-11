extends Node3D

func _ready():
	$gem.collected.connect($UI/gem_label._on_gem_pickup.bind())
