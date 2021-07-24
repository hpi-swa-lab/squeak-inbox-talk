accessing
objectDictionaryClass

	^ OrderedDictionary
	"Guaranteed order for comparison. With regular Dictionary, backreferences might be hit first during comparison and thus their underlying objects never be compared."