I am the abstract superclass for all test cases about Squeak Inbox Talk. I introduce a few new features and concepts as well as some minor convenience selectors that are not yet present in vanilla SUnit. This includes:

- monkey-patching for single selectors on classes or instances, see 'patching' protocol (via TalkTestMethodWrapper)
- assertions for comparing object graphs for snapshot testing, see #assertProperties:in: and also TalkTestSnapshotter
- reproducable #random generators
- convenience assertions such as #shouldNotChange:during:
- #wrapTest: as a mechanism to define individual and robust #setUp and #tearDown pairs at the same place from anywhere in your test