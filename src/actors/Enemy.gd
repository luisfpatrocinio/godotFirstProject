extends "res://src/actors/Actor.gd"
class_name Enemy

func _ready() -> void:
	set_physics_process(false)
	velocity.x = SPEED
	pass

func _physics_process(delta: float) -> void:
	var label = $Label
	label.text = str(velocity)
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y



func _on_StompDetector_body_entered(body: Node) -> void:
	if (body.global_position.y > get_node("StompDetector").global_position.y):
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()	# Destroy Enemy
	pass # Replace with function body.
