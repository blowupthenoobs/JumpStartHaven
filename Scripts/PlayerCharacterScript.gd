extends Node2D

@export var initialSpinSpeed: float;
@export var spinSpeed: float;
@export var nozzleEnd: RemoteTransform2D;
@export var playerBullet: PackedScene;
var direction = 1;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += spinSpeed * direction * delta;
	pass

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Shoot")):
		direction *= -1;
		var bullet = playerBullet.instantiate();
		add_sibling(bullet);
		bullet.setUp(nozzleEnd.position, )
		#print_debug("WE goin")
		
		pass
	pass
