# .NET 10 Neovim Setup — TODO

## Improvements

- [x] Create this TODO file
- [x] Switch OmniSharp → roslyn.nvim (reverted: Roslyn LSP crashes on WSL, OmniSharp restored)
- [x] Add global inlay hints via LspAttach autocmd
- [x] Fix DAP launch path for .NET 10 TFM (`bin/Debug/net10.0/`)
- [x] Add XML treesitter parser for `.csproj` / `.sln` files
- [x] Add XML formatter (`xmllint`) for `.csproj` files via conform.nvim
- [x] Add neotest + neotest-dotnet for in-editor test runner
- [x] Add `dotnet build` / `dotnet run` keymaps via floaterm
- [x] Write DOTNET.md documentation

## Notes

- OmniSharp is replaced entirely by roslyn.nvim; both must NOT be active simultaneously
- roslyn LSP server must be installed via `:MasonInstall roslyn` on first use
- neotest-dotnet requires `dotnet` CLI on PATH
- xmllint must be available on the system (`sudo apt install libxml2-utils` on Ubuntu/WSL)
