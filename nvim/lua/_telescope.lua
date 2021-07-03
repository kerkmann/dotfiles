local map = require('utils').map
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

require'telescope'.load_extension('project')

require('telescope').setup {
  defaults = {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    layout_strategy = 'flex',
    layout_config = {
      prompt_position = "top",
      horizontal = {
        -- width_padding = 0.1,
        -- height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        -- width_padding = 0.1,
        -- height_padding = 1,
        preview_height = 0.5,
      }
    },
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<M-q>"] = actions.smart_send_to_qflist,
      }
    },
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_prefix = "  ",
  },
  extensions = {
    project = {
      base_dir = '~/Projects',
      max_depth = 3
    }
  }
}

map("n", "<leader>fg", ":lua require('telescope.builtin').git_files{}<CR>", {silent = true})
map("n", "<leader>ff", ":lua require('telescope.builtin').fd{}<CR>", {silent = true})
map("n", "<leader>fF", ":lua require('telescope.builtin').fd({ hidden = true })<CR>", {silent = true})
map("n", "<leader>FF", ":lua require('telescope.builtin').file_browser({ hidden = true })<CR>", {silent = true})
map("n", "<leader>fr", ":lua require('telescope.builtin').live_grep{}<CR>", {silent = true})
map("n", "<leader>bb", ":lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy())<CR>", {silent = true})
map("n", "<leader>fb", ":lua require('telescope.builtin').current_buffer_fuzzy_find({previewer = false})<CR>", {silent = true})
map("n", "<leader>fe", ":lua require('telescope.builtin').treesitter{}<CR>", {silent = true})
map("n", "<leader>fm", ":lua require('telescope.builtin').marks(require('telescope.themes').get_ivy())<CR>", {silent = true})
map("n", "<leader>fp", ":lua require('telescope').extensions.project.project{ display_type = 'full' }<CR>", {silent = true})

-- lsp bindings
map("n", "<leader>ft", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", {silent = true})
map("n", "<leader>fT", ":lua require('telescope.builtin').lsp_workspace_symbols{}<CR>", {silent = true})
map('n', '<leader>lC', ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_ivy({previewer = false}))<CR>", {silent = true})
map("n", "<leader>lr", ":lua require('telescope.builtin').lsp_references{}<CR>", {silent = true})

map("n", "<leader><leader>q", ":lua require('telescope.builtin').quickfix()<CR>", {silent = true})
map("n", "<leader><leader>l", ":lua require('telescope.builtin').loclist()<CR>", {silent = true})
