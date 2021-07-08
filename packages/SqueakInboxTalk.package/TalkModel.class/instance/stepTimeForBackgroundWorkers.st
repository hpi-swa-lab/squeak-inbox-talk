background workers
stepTimeForBackgroundWorkers

	self flag: #performance.
	"Trade-off between liveness and performance. Fluent enough. Numbers from my machine (ct):
	100 ms - 67.7% overhead
	200 ms - 36.8% overhead
	500 ms - 7.4% overhead"
	^ 200 milliSeconds