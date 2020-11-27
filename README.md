# git-bisect-example-swift

This project, a Swift app for iOS, serves as an example that can be used to demonstrate `git-bisect`.

## Introduction

The app in this repository is just a very basic example app with a text label
and three buttons:

- A "Help" button that opens a help page (for demonstration purposes, just `https://example.com`)
- A "Change font" button that cycles through a couple of fonts and sets them on the label
- A "Show alert" button that shows a simple `UIAlertController`

## The issue we want to fix

While demo'ing the app, we realized that the app is not working as expected:
The "Show alert" button does no longer show an alert. But we are pretty certain
that it used to do that in the past.

Now, we could go back through all the commits and look at each and every one
of them. For this example repository, this might be rather quick. But let's assume
that our project was larger, with a lot more commits. Going through every commit
can be rather time-consuming.

**There has got to be a smarter way to find the bug.**

## `git-bisect`

From the documentation (`git help bisect`):

> Use binary search to find the commit that introduced a bug
>
> This command uses a binary search algorithm to find which commit in your project's history introduced a bug.
> You use it by first telling it a "bad" commit that is known to contain the bug,
> and a "good" commit that is known to be before the bug was introduced.
> Then git bisect picks a commit between those two endpoints and asks you whether
> the selected commit is "good" or "bad". It continues narrowing down the range
> until it finds the exact commit that introduced the change.

## Bisecting the example app

Let's try to find the bug using `git-bisect`.

First, fire up a Terminal and change your working directory to the root of this repository.

Now, start `git-bisect` by executing `git bisect start`.
Git has started bisecting, but nothing will be printed to the Terminal.

Repeat the following process:

```
Run the app and see if the problem exists
at the current commit.

- It does? Execute `git bisect bad`
- It does not? Execute `git bisect good`
```

The very first time you are executing one of the two commands, Git will wait
for you to manually checkout older commits until you find one that is `good`.
After every checkout, make sure to check whether the bug persists, and tell Git
about it (either with `git bisect bad` or `git bisect good`).

Once you found a `good` commit, Git will start jumping between commits,
narrowing down the commits that still need to be tested until you find the first one that was `bad`.

## Tips for effective bisecting

**Make sure that building individual commits succeeds.** Even though `git-bisect` allows you to skip individual commits in case you cannot judge whether the commit was good or bad (use `git bisect skip`), bisecting is easier and less frustrating when you were able to build the project at every commit successfully.

**Make sure that the tests are succeeding for every commit.** Being able to run the tests after Git has checked out a commit is a great and quick way to verify the code's state at that commit.

**Try to keep your commits small and meaningful (atomical).** Even though this is considered best practise regardless of `git-bisect`, having smaller commits make it easier for you to tell whether a commit is `good` or `bad` in case you were not able to build the project successfully, since you might be able to tell from the diff.

## License

This project is published under the [MIT license][license].

[license]: ./LICENSE.md
