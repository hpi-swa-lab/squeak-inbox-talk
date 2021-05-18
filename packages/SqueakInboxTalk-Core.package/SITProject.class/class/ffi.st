accessing
ffi

	^ SITProjects at: #ffi ifAbsentPut: [
		self new
			name: 'FFI';
			trunkRepository: (self findHttpRepository: 'http://source.squeak.org/FFI');
			inboxRepository: (self findHttpRepository: 'http://source.squeak.org/FFIinbox');
			yourself]