-- roslyn.nvim disabled: Roslyn LSP crashes on WSL due to FileSystemWatcher
-- stack overflow in DefaultFileChangeWatcher during project load.
-- C# is handled by OmniSharp (see lsp-config.lua) which works correctly on WSL.
return {}
