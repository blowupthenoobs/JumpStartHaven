extends CharacterBody2D
class_name EnemyScript

@export var moveSpeed: float
var movementDirection: Vector2

func _ready() -> void:
	look_at(Vector2(0, 0));
	movementDirection = Vector2(cos(rotation), sin(rotation));
	pass


func _physics_process(delta: float) -> void:
	if(!UiManagementScript.instance.gameEnded):
		velocity = movementDirection * moveSpeed * delta;
		var collision = move_and_collide(velocity);
		if collision:
			collisionEffect(collision)
		pass
	pass

func collisionEffect(collision: KinematicCollision2D) -> void:
	#print_debug("hit something...")
	
	if(collision.get_collider() is PlayerCharacterScript):
		#print_debug("hit player");
		UiManagementScript.instance.openDeathUI();
		pass
	pass

func killEnemy() -> void:
	UiManagementScript.instance.addScore();
	queue_free();
	pass
