vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_footer = { 'https://gitee.com/uforever/nvim-config' }

vim.g.dashboard_custom_section = {
    a = {
        description = { '  Projects              ' },
        command = 'Telescope projects'
    },
    b = {
        description = { '  Recently files        ' },
        command = 'Telescope oldfiles'
    },
    c = {
        description = { '  Find file             ' },
        command = 'Telescope find_files'
    },
    d = {
        description = { '  Find text             ' },
        command = 'Telescope live_grep'
    },
    e = {
        description = { '  Edit keymaps          ' },
        command = 'edit ~/.config/nvim/lua/keymaps.lua'
    },
    f = {
        description = { '  Quit                  ' },
        command = 'q'
    },
}

vim.g.dashboard_custom_header = {
  -- "                         ______                     ",
  -- ' _________        .---"""      """---.              ',
  -- ":______.-':      :  .--------------.  :             ",
  -- "| ______  |      | :                : |             ",
  -- "|:______B:|      | |  Little Error: | |             ",
  -- "|:______B:|      | |                | |             ",
  -- "|:______B:|      | |  Power not     | |             ",
  -- "|         |      | |  found.        | |             ",
  -- "|:_____:  |      | |                | |             ",
  -- "|    ==   |      | :                : |             ",
  -- "|       O |      :  '--------------'  :             ",
  -- "|       o |      :'---...______...---'              ",
  -- "|       o |-._.-i___/'             \\._             ",
  -- "|'-.____o_|   '-.   '-...______...-'  `-._          ",
  -- ":_________:      `.____________________   `-.___.-. ",
  -- "                 .'.eeeeeeeeeeeeeeeeee.'.      :___:",
  -- "               .'.eeeeeeeeeeeeeeeeeeeeee.'.         ",
  -- "              :____________________________:        ",
  
  "  _______________________________________________________  ",
  "((                                                       ))",
  " ))                     Try Harder                      (( ",
  "((                                                       ))",
  "  -------------------------------------------------------  ",
  "",

  ",---,---,---,---,---,---,---,---,---,---,---,---,---,-------,",
  "|Esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | + | ' |  <-   |",
  "|---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-----|",
  "| ->| | Q | W | E | R | T | Y | U | I | O | P | ] | ^ |     |",
  "|-----',--',--',--',--',--',--',--',--',--',--',--',--'| ﬋  |",
  "| Caps | A | S | D | F | G | H | J | K | L | \\ | [ | * |    |",
  "|----,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---'----|",
  "|   | < | Z | X | C | V | B | N | M | , | . | - |  Shift   |",
  "|----'-,-',--'--,'---'---'---'---'---'---'-,-'---',--,------|",
  "| ctrl |  | alt |                          | alt  |  | ctrl |",
  "'------'  '-----'--------------------------'------'  '------'",
}
