controlling
activatePatchBlock: aBlock for: rcvr with: arguments

	| patchArgs |
	patchArgs := (arguments copyWithFirst: rcvr) first: aBlock numArgs.
	^ aBlock simulateValueWithArguments: patchArgs caller: self