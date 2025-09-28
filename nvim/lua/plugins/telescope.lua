return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        -- Close 1 buffer (dd)
                        ["dd"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                        end,
                        -- Close all buffers (xx)
                        ["xx"] = function(prompt_bufnr)
                            actions.close(prompt_bufnr)
                            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                                if vim.api.nvim_buf_is_loaded(buf) then
                                    vim.api.nvim_buf_delete(buf, { force = true })
                                end
                            end
                            print("Closed all buffers")
                        end,
                    },
                },
            },
        })

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
}
