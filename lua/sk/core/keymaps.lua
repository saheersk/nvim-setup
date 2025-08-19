-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- line movement with Option + hjkl
keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" }) -- move line down
keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" }) -- move line up
keymap.set("n", "<M-h>", "<<", { desc = "Indent line left" }) -- indent line left
keymap.set("n", "<M-l>", ">>", { desc = "Indent line right" }) -- indent line right
keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" }) -- move selection down
keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" }) -- move selection up
keymap.set("v", "<M-h>", "<gv", { desc = "Indent selection left" }) -- indent selection left
keymap.set("v", "<M-l>", ">gv", { desc = "Indent selection right" }) -- indent selection right

-- Alternative keymaps for macOS (in case Option key doesn't work)
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down (alt)" }) -- move line down
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up (alt)" }) -- move line up
keymap.set("n", "<A-h>", "<<", { desc = "Indent line left (alt)" }) -- indent line left
keymap.set("n", "<A-l>", ">>", { desc = "Indent line right (alt)" }) -- indent line right
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down (alt)" }) -- move selection down
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up (alt)" }) -- move selection up
keymap.set("v", "<A-h>", "<gv", { desc = "Indent selection left (alt)" }) -- indent selection left
keymap.set("v", "<A-l>", ">gv", { desc = "Indent selection right (alt)" }) -- indent selection right

---------------------
-- Go Keymaps ------
---------------------

-- Go specific keymaps (available when go.nvim is loaded)
keymap.set("n", "<leader>gsj", "<cmd>GoAddTag json<cr>", { desc = "Add json struct tags" })
keymap.set("n", "<leader>gsy", "<cmd>GoAddTag yaml<cr>", { desc = "Add yaml struct tags" })
keymap.set("n", "<leader>gst", "<cmd>GoAddTag<cr>", { desc = "Add struct tags" })
keymap.set("n", "<leader>gso", "<cmd>GoRMTag<cr>", { desc = "Remove struct tags" })
keymap.set("n", "<leader>gsf", "<cmd>GoFillStruct<cr>", { desc = "Fill struct" })
keymap.set("n", "<leader>gse", "<cmd>GoIfErr<cr>", { desc = "Add if err" })
keymap.set("n", "<leader>gch", "<cmd>GoCoverage<cr>", { desc = "Test coverage" })
keymap.set("n", "<leader>gca", "<cmd>GoCoverage -a<cr>", { desc = "Test coverage all" })
keymap.set("n", "<leader>gcr", "<cmd>GoCoverageClear<cr>", { desc = "Clear coverage" })
keymap.set("n", "<leader>gte", "<cmd>GoTestSum<cr>", { desc = "Test sum" })
keymap.set("n", "<leader>gts", "<cmd>GoTest<cr>", { desc = "Go test" })
keymap.set("n", "<leader>gtr", "<cmd>GoTestFunc<cr>", { desc = "Go test func" })
keymap.set("n", "<leader>gtf", "<cmd>GoTestFile<cr>", { desc = "Go test file" })
keymap.set("n", "<leader>gta", "<cmd>GoAlt!<cr>", { desc = "Open alt file" })
keymap.set("n", "<leader>gtx", "<cmd>GoTestPkg<cr>", { desc = "Go test pkg" })
keymap.set("n", "<leader>grc", "<cmd>GoRun<cr>", { desc = "Go run" })
keymap.set("n", "<leader>grs", "<cmd>GoStop<cr>", { desc = "Go stop" })
keymap.set("n", "<leader>grr", "<cmd>GoRestart<cr>", { desc = "Go restart" })
keymap.set("n", "<leader>grl", "<cmd>GoLint<cr>", { desc = "Go lint" })
keymap.set("n", "<leader>grv", "<cmd>GoVet<cr>", { desc = "Go vet" })
keymap.set("n", "<leader>grm", "<cmd>GoMake<cr>", { desc = "Go make" })
keymap.set("n", "<leader>gri", "<cmd>GoInstall<cr>", { desc = "Go install" })
keymap.set("n", "<leader>grg", "<cmd>GoGenerate<cr>", { desc = "Go generate" })
keymap.set("n", "<leader>grf", "<cmd>GoGenReturn<cr>", { desc = "Go generate return" })
keymap.set("n", "<leader>gtn", "<cmd>GoCreateTest<cr>", { desc = "Go create test" })
keymap.set("n", "<leader>gfs", "<cmd>GoFillSwitch<cr>", { desc = "Go fill switch" })
keymap.set("n", "<leader>gfw", "<cmd>GoFillPar<cr>", { desc = "Go fill par" })
keymap.set("n", "<leader>gij", "<cmd>GoImpl<cr>", { desc = "Go impl" })
keymap.set("n", "<leader>gie", "<cmd>GoImplE<cr>", { desc = "Go impl interface" })
keymap.set("n", "<leader>gtd", "<cmd>GoTestAdd<cr>", { desc = "Go test add" })
keymap.set("n", "<leader>gmc", "<cmd>GoModTest<cr>", { desc = "Go mod test" })
keymap.set("n", "<leader>gmi", "<cmd>GoModInit<cr>", { desc = "Go mod init" })
keymap.set("n", "<leader>gmt", "<cmd>GoModTidy<cr>", { desc = "Go mod tidy" })
keymap.set("n", "<leader>gmu", "<cmd>GoModUpgrade<cr>", { desc = "Go mod upgrade" })
keymap.set("n", "<leader>gmv", "<cmd>GoModVendor<cr>", { desc = "Go mod vendor" })
