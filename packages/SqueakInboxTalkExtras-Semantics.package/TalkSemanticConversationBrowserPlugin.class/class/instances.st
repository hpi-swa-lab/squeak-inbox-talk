accessing
instances

	^ Instances ifNil:
		[Instances := WeakKeyDictionary new.
		WeakArray addWeakDependent: Instances.
		Instances]