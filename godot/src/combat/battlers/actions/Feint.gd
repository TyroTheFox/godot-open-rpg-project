extends CombatAction

func execute(targets: Array):
	assert(initialized)
	if actor.party_member and not targets:
		return false
	
	for target in targets:
		yield(actor.skin.move_to(target), "completed")
		if (target.stats.speed > actor.stats.speed):
			var hit = Hit.new(actor.stats.speed, actor.stat_changes.speed)
			target.change_stats("speed", hit)
		yield(actor.get_tree().create_timer(1.0), "timeout")
		yield(return_to_start_position(), "completed")
	return true
