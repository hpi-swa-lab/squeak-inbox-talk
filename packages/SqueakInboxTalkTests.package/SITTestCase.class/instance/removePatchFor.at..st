patching - private
removePatchFor: anObject at: selector

	^ ((patches ifNil: [^ nil]) at: anObject ifAbsent: [^ nil]) removeKey: selector