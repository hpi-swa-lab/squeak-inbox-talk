# Squeak Inbox Talk

[![Tests](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions/workflows/tests.yml/badge.svg)](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions/workflows/tests.yml)
[![Coverage Status](https://coveralls.io/repos/github/hpi-swa-lab/squeak-inbox-talk/badge.svg?branch=squeak60)](https://coveralls.io/github/hpi-swa-lab/squeak-inbox-talk)
[![Open flags](https://shields.io/endpoint?url=https://gist.githubusercontent.com/LinqLover/36dd3c4a155eed5aa7e874415cd60eea/raw/flags%2523refs%2523heads%2523squeak60.json)](https://github.com/hpi-swa-lab/squeak-inbox-talk/search?type=code&l=Smalltalk&q=%22flag%3A+%22)
[![Release](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions/workflows/release.yml/badge.svg)](https://github.com/hpi-swa-lab/squeak-inbox-talk/releases)

> Bringing squeak-dev into your image

A project originally conducted in the course of the Live Programming Seminar 2021 @ HPI.
Many thanks to [Marcel Taeumel](https://github.com/marceltaeumel) for his diligent mentoring and advice!

![Squeak Inbox Talk](./assets/SqueakInboxTalk.png)

## Installation

Squeak Inbox Talk runs on Squeak 6.0 and newer versions.
We follow the trunk-based development style of Squeak and strive to deliver full support for the latest Squeak Trunk.
New features are only supported by the Trunk version of Squeak Inbox Talk.
Older versions and releases of Squeak will only receive urgent fixes.

### Automatic Installation (recommended)

To install and start Squeak Inbox Talk, go to the main docking bar and choose <kbd>Tools</kbd> > <kbd>Squeak Inbox Talk</kbd>.

### Manual Installation

1. Get a [Squeak](https://squeak.org) image (Squeak 6.0 or newer)

2. Install the latest system updates.

3. Open a workspace and evaluate the following:

   - **Squeak Trunk:**

     ```smalltalk
     Metacello new
     	baseline: 'SqueakInboxTalk';
     	repository: 'github://hpi-swa-lab/squeak-inbox-talk:main';
     	load.
     ```

   - **Squeak 6.0:**

     ```smalltalk
     Metacello new
     	baseline: 'SqueakInboxTalk';
     	repository: 'github://hpi-swa-lab/squeak-inbox-talk:squeak60';
     	load.
     ```

Alternatively, you can download the one-click image from the [latest release](https://github.com/hpi-swa-lab/squeak-inbox-talk/releases) and run it with zero installation effort.

For detailed information on how to use the tool - in case this should not be straightforward -, see the [usage documentation](./USAGE.md).

## Why?

Many Squeakers have experienced the following troubles in the past:

1. Tedious navigation on the list: Where has this patch gone? Can someone remember where we were discussing this funky thing recently?
2. High entry barrier for new contributors: You need to sign up on the mailing list to follow discussions.
3. Hard review process: Notifications and discussions appear in your email client, but if you want to check out some code, you will switch to your image, of course.

Squeak Inbox Talk attempts to solve all these issues by merging all relevant artifacts in Squeak, including emails and [Monticello](https://wiki.squeak.org/squeak/1287) contributions, allowing developers to explore them interactively.
It comes with a free-text search and several powerful filters for aspects such as packages, review state of a contribution, and your personal involvement.
These filters should make it easier to survey certain domains, gain a better understanding of the connection between inbox versions, or keep track of your own proposals.

## How does it work?

Basically, Squeak Inbox Talk is implemented by reusing and assembling together the following existing solutions: [Squeak History](https://github.com/hpi-swa/squeak-history), a project originally developed by Marcel (mt) that scrapes and processes all mailing list conversations from the [pipermail archives](http://lists.squeakfoundation.org/pipermail/squeak-dev/); the `SMTPClient` in Squeak for sending messages; and the Monticello infrastructure, which remains the heart of our development workflow. Optionally, further components such as [`IMAPClient`](https://github.com/hpi-swa-teaching/IMAPClient) might follow later. On top of this, Squeak Inbox Talk adds a convenient layer for exploring and filtering conversations and contributions.

## Implementational notes

- This project is proud to use [smalltalkCI](https://github.com/hpi-swa/smalltalkCI) and the [create-image GitHub action](https://github.com/marketplace/actions/create-image).
- [`UPSTREAM.md`](./UPSTREAM.md) contains a list of contributions that were made to upstream dependencies of this repository in the context of this project.

## Further reading

- [Official announcement thread on the squeak-dev mailing list](http://forum.world.st/ANN-Squeak-Inbox-Talk-bringing-squeak-dev-into-your-image-td5130575.html) ([mirror on lists.squeakfoundation.org](http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-July/216008.html))
- [Andrew Black, Stéphane Ducasse, Oscar Nierstrasz, Damien Pollet, Damien Cassou, Marcus Denker, Christoph Thiede, and Patrick Rein. *Squeak by Example. 5.3 Edition.* 2020.](https://github.com/hpi-swa-lab/SqueakByExample-english/releases/tag/5.3)
