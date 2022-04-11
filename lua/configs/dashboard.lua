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
    [[ .....................::::::...................... ]],
    [[ ..................^JP57!?J!!^:................... ]],
    [[ ................^PG5JJY?!7~!!7^.................. ]],
    [[ ................Y&G5?Y5GY!!!?7?!................. ]],
    [[ .............. :GB#PJYPJ7???JJYY: ............... ]],
    [[ .............. ^##&G5PG5YYJJYYJJ: ............... ]],
    [[ ................^!!7!J!??7^^~!!.................. ]],
    [[ ................ ~~J5JY?!?75!~^ ................. ]],
    [[ ..................:P#BBY55JP~  .................. ]],
    [[ ...............    :7P5PBP?~   .................. ]],
    [[ ............   .:^~7Y5?^JY5J^^.    .............. ]],
    [[ ........... .^7?P&BPGBB?BPJY##GJ~. .............. ]],
    [[ .......... :5Y#GB&&&&&B5G&#&&&&&PJ? ............. ]],
    [[ .......... ^#YP&&#GBBBBGBB#B#&&#YB5 ............. ]],
    [[ .......... .GPJG&#BBGGPY5GBBPGBYYPJ  ............ ]],
    [[ .......... :PP?5&&&&P5BPP5YGGBB!?5J: ............ ]],
    [[ .......... 7PGYP&&&&##GYYGGG#B#?P##? ............ ]],
    [[ ......... :BPPJB#BB#&&####GGBGBJP&G?. ........... ]],
    [[ ......... ?&BP?#BP5PGYJ755?JYGB55G557 ........... ]],
    [[ ..........P#&P5&#P5PPJ??55JYJPGGJGB&G............ ]],
    [[ ..........PPG?B###&&##GPPGGBGPG#?B#&#:........... ]],
    [[ ..........G&P7B5BB#BPB5Y?5YPP55BY5##G:........... ]],
    [[ ..........G&5J&#######&&#BGG5555Y?G#J............ ]],
}
