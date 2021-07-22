accessing
objectDictionaryClass

	^ OrderedDictionary
	"guaranteed order for comparison. with regular Dictionary, backreferences might be hit first during comparison and thus their underlying objects never be compared."