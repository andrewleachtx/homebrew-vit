# vit Homebrew tap

Install [vit](https://github.com/andrewleachtx/vit), a minimal CLI for attaching
visuals to Git commits. The Homebrew package is `vit-cli`; the command is `vit`.

## Installation

```bash
brew install andrewleachtx/vit/vit-cli
```

## Usage

From a Git repository with at least one commit:

```bash
vit attach render.png demo.mp4
vit show
```

Both commands use `HEAD` by default. To choose a commit, pass its full hash or a
unique prefix with `--hash`.

vit keeps local copies of your files without changing Git history. Attachments
are not transferred by `git push` or `git clone`.

See the [vit README](https://github.com/andrewleachtx/vit#readme) for more examples.

## Updates

```bash
brew update
brew upgrade andrewleachtx/vit/vit-cli
```
