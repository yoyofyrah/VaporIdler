extends Node2D

## auto score gain starting value
var elapsed_time = 0
var AudioOff = preload("res://assets/audioOff.png")
var AudioOn = preload("res://assets/audioOn.png")

func _process(delta: float) -> void:
	
## Checks for award dictionary
	for award_key in global.award_data: 
		if global.number >= int(award_key):
			get_node(global.award_data[award_key]).visible = true

## Sound button
func _on_sound_button_pressed() -> void:
	if $BGM.playing == true:
		$BGM.playing = false
		$SoundButton.icon = AudioOff
	else:
		$BGM.playing = true
		$SoundButton.icon = AudioOn

func _on_bgm_finished() -> void:
	$BGM.play()

## Makes big pink sun clickable 
func _on_button_pressed() -> void:
	global.number += global.clickValue

## Converts number variable from global into string for display
	$Score.text = str(global.number)
	print(global.number)

## Shop Upgrade buttons, in order of appearance.

# Test button; comment in as needed.
#func _on_test_pressed() -> void:
		#global.clickValue = 10000000000

func _on_upgrade_plus_five_pressed() -> void:
	if global.number >= 200:
		global.clickValue = 5
		global.number -= 200
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradePlusFive.visible = false

func _on_upgrade_plus_ten_pressed() -> void:
	if global.number >= 500:
		global.clickValue = 10
		global.number -= 500
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradePlusTen.visible = false
		
func _on_upgrade_plus_hundred_pressed() -> void:
	if global.number >= 5000:
		global.clickValue = 100
		global.number -= 5000
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradePlusHundred.visible = false

func _on_upgrade_plus_thousand_pressed() -> void:
	if global.number >= 10000:
		global.clickValue = 1000
		global.number -= 10000
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradePlusThousand.visible = false
	
func _on_upgrade_plus_ten_thousand_pressed() -> void:
	if global.number >= 50000:
		global.clickValue = 10000
		global.number -= 50000
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradePlusTenThousand.visible = false
	
func _on_upgrade_plus_million_pressed() -> void:
	if global.number >= 100000:
		global.clickValue = 1000000
		global.number -= 100000
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradePlusMillion.visible = false
		$Shop/ScrollContainer/VBoxContainer/UpgradeTimesTwo.visible = true

## creates an auto score gain per second
func _on_upgrade_auto_click_pressed() -> void:
	if global.number >= 500:
		global.clickValue = 10
		global.number -= 500
	$AutoClick.start()
	$Shop/ScrollContainer/VBoxContainer/UpgradeAutoClick.visible = false
	
func _on_auto_click_timeout() -> void:
	elapsed_time += 1
	global.number = global.number + (int(elapsed_time) * 2)
	elapsed_time -= 1
	$Score.text = str(global.number)

func _on_upgrade_times_two_pressed() -> void:
	if global.number >= 500000:
		global.clickValue = global.clickValue * 2
		global.number -= 500000
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradeTimesTwo.visible = false
		$Shop/ScrollContainer/VBoxContainer/UpgradeTimesHundred.visible = true

func _on_upgrade_times_hundred_pressed() -> void:
	if global.number >= 1500000:
		global.clickValue = global.clickValue * 100
		global.number -= 1500000
		$Score.text = str(global.number)
		$Shop/ScrollContainer/VBoxContainer/UpgradeTimesHundred.visible = false

func _on_upgrade_set_to_zero_pressed() -> void:
	if global.number > 0:
		global.clickValue = 1
		global.number -= global.number
		$Score.text = str(global.number)

## Hover Upgrades Text, in order of appearance

func _on_upgrade_plus_five_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusFive.text = "200"

func _on_upgrade_plus_five_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusFive.text = "+5 per click"
	
func _on_upgrade_plus_ten_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusTen.text = "500"

func _on_upgrade_plus_ten_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusTen.text = "+10 per click"
	
func _on_upgrade_auto_click_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeAutoClick.text = "500"

func _on_upgrade_auto_click_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeAutoClick.text = "+2 per sec"
	
func _on_upgrade_plus_hundred_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusHundred.text = "5000"

func _on_upgrade_plus_hundred_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusHundred.text = "+100 per click"

func _on_upgrade_plus_thousand_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusThousand.text = "10000"

func _on_upgrade_plus_thousand_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusThousand.text = "+1000 per click"
	
func _on_upgrade_plus_ten_thousand_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusTenThousand.text = "50000"

func _on_upgrade_plus_ten_thousand_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusTenThousand.text = "+10000 per click"
	
func _on_upgrade_plus_million_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusMillion.text = "100000"

func _on_upgrade_plus_million_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradePlusMillion.text = "+100000 per click"
	
func _on_upgrade_times_two_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeTimesTwo.text = "500000"

func _on_upgrade_times_two_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeTimesTwo.text = "x2 per click"
	
func _on_upgrade_times_hundred_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeTimesHundred.text = "1500000"

func _on_upgrade_times_hundred_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeTimesHundred.text = "x100 per click"
	
func _on_upgrade_set_to_zero_mouse_entered() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeSetToZero.text = "free"

func _on_upgrade_set_to_zero_mouse_exited() -> void:
	$Shop/ScrollContainer/VBoxContainer/UpgradeSetToZero.text = "set score to zero"
