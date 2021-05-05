# Squeak Inbox Talk – Exposé

A tool to empower volunteers to contribute features and discussions to Squeak, freeing them from the need of leaving them to do so, and making overall collaboration as live and fluent as possible.

## Applicability

- Mailing list (must be supported by `squeak-history`, i.e., hosted using `pipermail`)
- Monticello repository (group)

## Non-functional requirements

- **Maintain the UI responsive** whenever performing expensive background operations such as receiving or sending contributions.
- **Design a Smalltalk-stylish dialog structure** that does not enforce singleton windows but comprises many small windows to facilitate multitasking and free arrangement of contents.
- **Emphasize liveness of the entire UI,** i.e., try to avoid displaying outdated information.
- **Avoid customer retention** by avoiding flooding the centralized data sources with proprietary (meta) information.
  Don't force users to make a binary decision between Squeak Inbox Talk and traditional communication interfaces.

## Use Cases

### Bootstrapping

The tool should present itself to newcomers in a very familiar and clear way.

- **On the first of the tool, display a short introductory welcome message.**
  It should teach the user about the general philosophy of the tool and provide some simple usage introduction.
  This information shall also be accessible at a later point (i.e., via a menu).

  Maybe extract some contents into a `HelpTopic`.

- **On the first start of the tool, present a simple configuration dialog.**
  The dialog should ask the user for permission before loading all data from the mailing lists.
  Furthermore, the user should be able to save login credentials for SMTP/IMAP access.
  For reconfiguration, this dialog shall also be accessible at a later point (i.e., via a menu).

  For convenience, it would be very helpful if `squeak-history` could be extended to download a relevant slice of the data (e.g., newest *n* months) only.

- **On the first contribution of the user, present a credentials configuration dialog again** unless the user is already authenticated.

### Survey contributions and discussions

The tool shall allow the user to browse all current and past contributions and related discussions.

- **Get an overview** of all contributions and discussions.
  They should be enriched with useful meta information such as the *general state* of a proposal (e.g., "pending review", "accepted", "rejected") and *individual associations* (relationship, e.g., "thread owner", "mentioned", "replied"; counter of unread messages).

- **Use filters** for all items.
  Possible filters include all meta information from above but also:

  * Content (messages/source code)
  * Contributors
  * Date/time
  * Domain (e.g., by repository or package)
  * Code ownership (e.g., derived from former/related timestamps)
  * Type (i.e., changeset/repository version/others)

### Create a contribution

The tool should make it possible to initiate a new conversation.

- **Upload a Monticello version.**
- **Upload a changeset.**
- **Write a message** without attached patches.

Even though existing interfaces exist to create a Monticello version or a changeset, the tool should provide a more convenient entry point to them, e.g. by showing direct links at a central place in the main window.
Additionally, the tool could support the user to identify glitches in a patch before sending it, e.g., by reusing the slip search of the `ChangeSorter` or checking the version description/preamble of a patch for real content.
It would even be possible to display advanced analysis results such as SWALint statistics or failing tests at this place.

### Conduct discussion

The tool shall provide basic features to participate in ongoing discussions similar to the features of an email client.

- **Read all messages of a conversation,** each of them decorated with central metadata such as date/time, author, and subject.

  Use text styling to emphasize primary/secondary elements of a message, e.g. use gray color/italic for citations or apply syntax highlighting to code sections.
  Insert links to mentioned objects such as other conversations or code objects (e.g., classes or selectors).

- **Reply to a conversation** by writing plain text or text with simple formatting.
  Make it possible to embed related contents into the reply, such as citations of previous statements, code snippets, or references to other conversational or source code objects.

### Review or revise a submission (advanced)

To benefit from the integration into a wonderful live Squeak system, the tool should provide more convenient and interactive ways to review submitted code and revise it on-demand.
For this, a separate *code view* should be integrated.

- **Browse proposed patches together with any annotated discussion threads.**

  Every submitted patch such as a repository version or a changeset should be openable in a conventional code browser.
  The code browser should either display the proposed eventual version of the code or the diffs only.
  
  Attached to the relevant lines or definitions, any associated discussion threads should be shown.
  These threads have to be parsed from excerpts of the conversation that mention or reference a piece of code.
  It should be possible to jump from a discussion thread to the relevant place in the conversation or vice versa.

- **Compile a review/reply from the code view.**

  While browsing the code, the user should be able to respond to an existing discussion thread or to create new threads by selecting a code range or definition.

  At the time of writing a response, the thread should be updated in the draft window of the reply to the entire conversation (see use case "Reply to a conversation").
  Threads are represented by citing a relevant code range or existing threads in the new reply.
  Analogously, at the time of editing the draft of a reply to the conversation, all discussion threads in the code view should be updated.
