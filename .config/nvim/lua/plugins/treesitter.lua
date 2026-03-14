return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    -- No build step needed — Nix provides nvim-treesitter.withAllGrammars
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Nix manages all grammars via withAllGrammars, so no ensure_installed needed
        ensure_installed = {},

        -- MUST be false on NixOS — can't compile parsers at runtime
        auto_install = false,

        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
