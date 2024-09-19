extends Area3D

signal collected

func _on_body_entered(body: Node3D) -> void:
<<<<<<< Updated upstream
	print('coin collected')
	collected.emit()
	queue_free()
=======
    print('coin collected')
    queue_free()
>>>>>>> Stashed changes
