extends Area3D

signal collected

func _ready():
	$AnimationPlayer.play('floating')

func _on_body_entered(body: Node3D) -> void:
	print('coin collected')
	collected.emit()
	queue_free()
