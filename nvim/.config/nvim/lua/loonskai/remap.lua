vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>")

-- BOX Specific - TODO: Put into a separate file
local function insertTicketNum()
    local ticket = vim.fn.substitute(vim.fn.getcwd(), '^.*/', '', '')
    vim.fn.setreg("+", ticket) -- copy to the clipboard
end
vim.keymap.set("n", "<leader>bt", insertTicketNum, {
    silent = true,
    noremap = true,
    desc = "Copy the current dir name to the clipboard"
})
