controlling
send: selector to: rcvr with: arguments lookupIn: lookupClass
	"Copied and patched (badum-tss...) from super"

	| meth methClass primIndex val ctxt |
	lookupClass == (self objectClass: rcvr) ifTrue: [
		self patchProvider
			patchFor: rcvr
			at: selector
			ifPresent: [:patchBlock | ^ self activatePatchBlock: patchBlock for: rcvr with: arguments]].
	
	(meth := lookupClass lookupSelector: selector) ifNil: [
		selector == #doesNotUnderstand: ifTrue: [self error: 'Recursive message not understood!' translated].
		^ self
			send: #doesNotUnderstand:
			to: rcvr
			with: {(Message selector: selector arguments: arguments) lookupClass: lookupClass}
			lookupIn: lookupClass].
	
	((methClass := self objectClass: meth) == CompiledMethod or: [methClass == CompiledBlock]) ifFalse: ["Object as Methods (OaM) protocol: 'The contract is that, when the VM encounters an ordinary object (rather than a compiled method) in the method dictionary during lookup, it sends it the special selector #run:with:in: providing the original selector, arguments, and receiver.'. DOI: 10.1145/2991041.2991062."
	^ self send: #run:with:in: to: meth with: {selector. arguments. rcvr}].
	
	meth numArgs = arguments size ifFalse: [^ self error: ('Wrong number of arguments in simulated message {1}' translated format: {selector})].
	(primIndex := meth primitive) > 0 ifTrue: [
		val := self doPrimitive: primIndex method: meth receiver: rcvr args: arguments.
		(self isPrimFailToken: val) ifFalse: [^ val]].
	
	(selector == #doesNotUnderstand: and: [lookupClass == ProtoObject]) ifTrue: [^ self error: ('Simulated message {1} not understood' translated format: {arguments first selector})].
	
	ctxt := Context sender: self receiver: rcvr method: meth arguments: arguments.
	(primIndex isInteger and: [primIndex > 0]) ifTrue: [ctxt failPrimitiveWith: val].
	
	^ ctxt