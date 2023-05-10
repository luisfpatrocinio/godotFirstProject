extends Actor
class_name Player

export var jumpForce = 1800
var direction	

func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	print("pula") 
	velocity.y = -jumpForce
	
func _on_EnemyDetector_body_entered(body: Node) -> void:	
	if body is Enemy:
		print("Fui de breço")
		queue_free()


func _physics_process(delta: float) -> void:
	
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = SPEED * direction
	velocity.y += delta * gravity
	
	if (Input.is_action_just_pressed("jump")):
		velocity.y = -jumpForce
	
	# Reduzir força do pulo ao soltar o botão.
	if (velocity.y < 0 and Input.is_action_just_released("jump")):
		velocity.y /= 2
	
	velocity = move_and_slide(velocity, FLOOR_NORMAL)	 





