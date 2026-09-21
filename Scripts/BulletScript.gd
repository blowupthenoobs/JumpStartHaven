extends CharacterBody2D


@export var maxSpeed: float
var currentSpeed: float
@export var accelleration: float
var movementDirection: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setUp(spawnPoint: Vector2, direction: float):
	position = spawnPoint;
	rotation = direction;
	movementDirection = Vector2(cos(rotation), sin(rotation));
	currentSpeed = maxSpeed / 3;
	#print_debug("rotation is:", rotation, " moveDirection is: ", movementDirection);
	pass

func _physics_process(delta: float) -> void:
	alterSpeed(delta)
	velocity = movementDirection * currentSpeed * delta;
	var collision = move_and_collide(velocity);
	if collision:
		collisionEffect(collision)
	alterSpeed(delta);

func alterSpeed(delta: float):
	if(currentSpeed < maxSpeed):
		currentSpeed += accelleration * delta
	else:
		currentSpeed = maxSpeed
	pass

func collisionEffect(collision: KinematicCollision2D):
	var collider = collision.get_collider();
	if(collider is EnemyScript):
		collider.killEnemy();
		pass;
	queue_free()
