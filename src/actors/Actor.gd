extends KinematicBody2D
class_name Actor

export var SPEED = 300
export var gravity: = 3000.0
const FLOOR_NORMAL: = Vector2.UP

var velocity: = Vector2.ZERO

# Called every frame of your game
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	
