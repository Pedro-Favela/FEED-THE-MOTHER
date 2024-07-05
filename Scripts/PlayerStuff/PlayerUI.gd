extends CanvasLayer

func _process(_delta):
	$OxigenBar.value = $"../BreathManager".breath
	$HealthBar.value = $"..".health
