# Talos Homebrew tap

Talos's own tap for the beta CLI: Apple Silicon, macOS 14 or newer. This is not
a Homebrew/core formula or a notarized desktop application.

```sh
brew install talos-kernel/tap/talos
talos setup terminal
talos chat
```

## Updates and private state

Homebrew manages code in its versioned Cellar. The user's private profile lives
separately in `~/.talos/homebrew` (mode 0700): configuration, identity, projects,
workspace and event log. Installation and diagnostic commands do not start an agent
or initialize this profile. No other Talos installation is imported automatically.

Stop Talos and back up your profile before updating:

```sh
brew update
brew upgrade talos-kernel/tap/talos
```

`talos update` refuses a Homebrew-managed installation. Uninstalling the formula
leaves private state intact. Switching code versions is not a data rollback;
check migration compatibility before running older code against newer state.

## Package provenance

The formula pins Talos's signed source release by SHA-256. Each Python wheel is an
original upstream PyPI download pinned individually and checked again against the
release's hashed lock. Homebrew fetches the files; Python installation then runs
offline with no dependency resolution. There is no Talos wheel bundle or bottle.

Talos and this formula are MIT-licensed. Third-party components retain their own
licenses, including the native libraries in binary wheels; the formula's MIT label
does not relicense them. Review upstream notices before redistributing an installed
environment, especially PyAV/FFmpeg and its codec libraries.

- [Talos source and releases](https://github.com/talos-kernel/Talos)
- [Homebrew lifecycle documentation](https://github.com/talos-kernel/Talos/blob/main/docs/homebrew.md)
- [Signed installer for other supported environments](https://talos-agent.ch)

Beta software: keep backups and use a test profile before adopting it for important work.
