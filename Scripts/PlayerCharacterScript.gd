extends Node2D
class_name PlayerCharacterScript

@export var initialSpinSpeed: float;
@export var spinSpeed: float;
@export var nozzleEnd: RemoteTransform2D;
@export var playerBullet: PackedScene;
var direction = 1;

@export var enemySpawnRate: float;
var timeSinceLastEnemy: float;
@export var enemyPrefab: PackedScene;
@export var enemySpawnDistance: float;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("spawnStartingEnemies")
	#print_debug("running");
	pass # Replace with function body.

func spawnStartingEnemies() -> void:
	spawnEnemy();
	spawnEnemy();
	spawnEnemy();
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!UiManagementScript.instance.gameEnded):
		rotation += spinSpeed * direction * delta; # Spinny code
	pass

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Shoot") && !UiManagementScript.instance.gameEnded):
		direction *= -1;
		var bullet = playerBullet.instantiate();
		add_sibling(bullet);
		bullet.setUp(nozzleEnd.global_position, rotation);
		spawnEnemy();
		#print_debug("WE goin")
		
		pass
	pass


func spawnEnemy() -> void:
	var angle = randf_range(0, PI * 2);
	var enemy = enemyPrefab.instantiate();
	
	enemy.global_position = Vector2(cos(angle) * enemySpawnDistance, sin(angle) * enemySpawnDistance);
	add_sibling(enemy);
	#print_debug(enemy.global_position);
	pass
