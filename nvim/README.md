# Neovim / NvChad configuration

## Structure

- `init.lua`: lazy.nvim bootstrap, NvChad import, theme caches and user modules.
- `lua/plugins/`: plugin declarations, load events and dependencies.
- `lua/configs/`: plugin options and LSP configuration.
- `lua/options.lua`, `lua/mappings.lua`, `lua/autocmds.lua`: editor settings,
  mappings and user events. `lua/chadrc.lua` contains NvChad appearance options.
- `lazy-lock.json`: reproducible plugin revisions; review changes when updating.

## Performance fixes (2026-09-15)

The installed Neovim is 0.13-dev on macOS. Sampling a slow exit showed the main
thread blocked in `uv_fs_event_stop -> uv__fsevents_close -> uv_sem_wait`, while
the FSEvents thread waited inside `FSEventStreamStart`. A 500ms LSP shutdown
timeout alone did not solve this: the native call blocked the event loop.

- On macOS, LSP dynamic file watcher registration is disabled. rust-analyzer
  falls back to server-side watching. Open-buffer synchronization still works.
  Other servers may need a restart after external workspace changes if they
  depend on client-provided file notifications.
- Neovim 0.12+ uses the public `exit_timeout = 500` option. The old child-process
  SIGKILL loop, client-state overrides and `os.exit()` shortcuts are removed.
- Conform is the sole configured save formatter, with a 500ms timeout and no
  LSP fallback. A timeout saves without waiting for formatting to finish; use
  `:ConformInfo` to diagnose a formatter. Rust uses its Cargo edition, defaulting
  to 2024 for standalone files. Neovim's built-in Rust save hook is normally a
  no-op because its own autosave option defaults to off.
- Go loads for Go files, Peek on its commands, and remote SSHFS on its commands.
  Git conflict detection starts when a `GitConflict…` command is invoked.
- Plugin setup runs once through lazy.nvim. Gitsigns inline blame defaults to
  off; use the existing leader + `tb` mapping to toggle it.
- macOS also disables Gitsigns and nvim-tree filesystem watchers. External Git
  changes may require `:Gitsigns refresh`; refresh the file tree with `R`.
  Explicitly loading git-conflict can still create its own watcher; keep it
  unloaded during ordinary Rust editing.
- `lsp_fallback`, Gitsigns `enabled`, `undo_stage_hunk`, `toggle_deleted`,
  rust-analyzer `files.excludeDirs` and `reborrowHints` were replaced or removed.
  Leader + `hu` now toggles staging for the current hunk; leader + `td` previews
  the current hunk inline.

Tree-sitter stays on the compatible legacy `master` branch because this NvChad
setup uses `nvim-treesitter.configs`. Automatic installation on buffer entry is
disabled. Use `:TSInstallAll` or `:TSInstall rust` explicitly. Switching to `main`
requires migrating the installer and module APIs together; it is not a safe
branch-only update.

## Verification

Headless tests explicitly fire `UIEnter`, which NvChad needs to load LSP plugins.
A temporary Rust 2024 crate verified a connected rust-analyzer, completion
capability, actual rustfmt output, save and buffer deletion, and normal exit.
After watcher and loading fixes, a Git repository run took 3.66s including a deliberate 3s
LSP wait: save 70ms, buffer deletion 7ms. Before the watcher fix, the same
test took up to 18.32s. These are small-fixture timings, not a guarantee for every
workspace. Large-workspace indexing remains asynchronous and can take longer.

```bash
stylua --check init.lua lua
git diff --check
nvim --startuptime /tmp/nvim-startup.log path/to/file.rs
```

The requested Cargo checklist was attempted, but this Lua configuration has no
`Cargo.toml`, so Cargo workspace checks do not apply.

References: [Conform options](https://github.com/stevearc/conform.nvim),
[Neovim LSP](https://neovim.io/doc/user/lsp.html),
[rust-analyzer settings](https://rust-analyzer.github.io/book/configuration),
[Tree-sitter branches](https://github.com/nvim-treesitter/nvim-treesitter).

## NvChad starter

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
