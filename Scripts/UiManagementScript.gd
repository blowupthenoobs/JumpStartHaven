extends Camera2D
class_name UiManagementScript;

static var instance: UiManagementScript;
var gameEnded: bool = false;
var currentScore: int = 0;

@export var scoreDisplay: Label
@export var gameOverPanel: Panel
@export var finalDisplay: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self;
	updateScore();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func addScore() -> void:
	currentScore += 1;
	updateScore()
	pass

func updateScore() -> void:
	scoreDisplay.text = str(currentScore);
	pass

func openDeathUI() -> void:
	gameEnded = true;
	scoreDisplay.visible = false;
	gameOverPanel.visible = true;
	finalDisplay.text = "Killed " + str(currentScore) + " Enemies";
	pass


func _on_button_pressed() -> void:
	get_tree().reload_current_scene();
	pass # Replace with function body.
