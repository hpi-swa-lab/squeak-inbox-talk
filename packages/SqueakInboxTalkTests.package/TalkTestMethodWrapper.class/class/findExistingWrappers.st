support
findExistingWrappers
	"For troubleshooting. Try also:
	
	self findExistingWrappers do: [:ea | ea compiledMethod uninstall].
	self findExistingWrappers do: [:ea | ea actualClass removeSelector: ea selector].
	"

	^ self systemNavigation allMethodsSelect: [:method | (thisContext objectClass: method) ~= CompiledMethod]