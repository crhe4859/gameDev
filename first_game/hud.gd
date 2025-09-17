extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ScoreLabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	$MessageTimer.start()
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$ScoreLabel.hide()
	$Message.text = "Dodge the Clankers!"
	$Message.show()
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	$ScoreLabel.show()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
