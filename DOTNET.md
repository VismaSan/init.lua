# .NET 10 Development in Neovim

This document covers all .NET-specific features in this Neovim config, how to set them up, and how to use them.

---

## Setup (first time)

After pulling this config, do the following inside Neovim:

1. Install plugins: lazy.nvim will auto-install on startup.
2. Install the Roslyn language server:
   ```
   :MasonInstall roslyn
   ```
3. Install xmllint (for `.csproj` formatting) — in your WSL terminal:
   ```bash
   sudo apt install libxml2-utils
   ```
4. Restart Neovim. Open any `.cs` file — the Roslyn LSP will attach automatically.

---

## Features

### Language Server — Roslyn LSP (`roslyn.nvim`)

**Plugin:** `seblj/roslyn.nvim`  
**File:** `lua/visma/plugins/roslyn.lua`

Replaces OmniSharp with the same Roslyn language server used by Visual Studio. Provides:
- Full C# / .NET 10 IntelliSense
- Go-to-definition, references, rename, code actions
- Real-time Roslyn analyzer diagnostics
- Inlay hints (parameter names, inferred types — enabled automatically on attach)

| Keymap | Action |
|--------|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>ca` | Code actions |
| `gl` | Open diagnostics float |

**Inlay hints** are on by default. Toggle them with:
```
:lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
```

---

### Debugging — netcoredbg (`nvim-dap`)

**Plugin:** `mfussenegger/nvim-dap`  
**File:** `lua/visma/plugins/dap.lua`

Uses `netcoredbg` as the debug adapter. The launch configuration now defaults to the `.NET 10` TFM output folder:
```
<project>/bin/Debug/net10.0/<ProjectName>.dll
```
You can edit the path at the prompt when launching.

| Keymap | Action |
|--------|--------|
| `F5` | Continue / Start debugging |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |

**Attach to process:** Use the "Attach" configuration at the DAP launch prompt.

---

### Test Runner — neotest-dotnet

**Plugins:** `nvim-neotest/neotest` + `Issafalcon/neotest-dotnet`  
**File:** `lua/visma/plugins/neotest.lua`

Supports xUnit, NUnit, and MSTest. Requires `dotnet` on PATH.

| Keymap | Action |
|--------|--------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run all tests in current file |
| `<leader>td` | Debug nearest test (uses DAP) |
| `<leader>tS` | Stop running test |
| `<leader>ts` | Toggle test summary panel |
| `<leader>to` | Open test output |
| `<leader>tO` | Toggle output panel |

---

### Build / Run Keymaps

**File:** `lua/visma/plugins/dotnet.lua`  
Active only in `.cs` buffers. Opens results in a floating terminal.

| Keymap | Command |
|--------|---------|
| `<leader>db` | `dotnet build` |
| `<leader>dr` | `dotnet run` |
| `<leader>dp` | `dotnet publish -c Release` |
| `<leader>dc` | `dotnet clean` |

---

### Formatting

**Plugin:** `stevearc/conform.nvim`  
**File:** `lua/visma/plugins/conform.lua`

| File type | Formatter |
|-----------|-----------|
| `.cs` | `csharpier` (install: `dotnet tool install -g csharpier`) |
| `.xml` / `.csproj` / `.props` | `xmllint` (install: `sudo apt install libxml2-utils`) |

Format on save is enabled with a 2-second timeout.

---

### Syntax Highlighting

**Plugin:** `nvim-treesitter/nvim-treesitter`  
**File:** `lua/visma/plugins/nvim-treesitter.lua`

Parsers installed:
- `c_sharp` — C# syntax highlighting and indentation
- `xml` — `.csproj`, `.props`, `.targets` files

---

## Troubleshooting

**Roslyn LSP not attaching**
- Run `:Mason` and confirm `roslyn` is installed.
- Check `:LspInfo` in a `.cs` buffer.

**Inlay hints not showing**
- Confirm Neovim >= 0.10: `:echo v:version`
- Toggle: `:lua vim.lsp.inlay_hint.enable(true)`

**DAP can't find DLL**
- Confirm the project has been built: `dotnet build`
- The default path assumes `net10.0` — change if targeting a different TFM.

**neotest not finding tests**
- Ensure the project uses a supported test framework (xUnit, NUnit, MSTest).
- Run `:Neotest run` manually to see error output.

**xmllint not formatting**
- Install: `sudo apt install libxml2-utils`
- Verify: `which xmllint`
