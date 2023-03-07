extends Node

var PlayerScore = -2
var AIScore = -2

func _on_left_body_entered(body):
	AIScore += 1
	score_achieved()

func _on_right_body_entered(body):
	PlayerScore += 1
	score_achieved()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$AIScore.text = str(AIScore)
	$CountdownLabel.text = str(int($Countdown.time_left) + 1)

func _on_countdown_timeout():
	get_tree().call_group('ballgroup','restart_ball')
	$CountdownLabel.visible = false

func score_achieved():
	$Ball.position = Vector2(640,320)
	get_tree().call_group('ballgroup','stop_ball')
	$Countdown.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
