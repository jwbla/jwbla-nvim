local dap = require('dap')

dap.adapters.gdb = {
    type = 'server',
    port = 1234,
    exectuable = {
        command = 'gdb',
        args = {'--interpreter=mi2'},
    },
}

dap.configurations.cpp = {
    {
        name = "Debug with GDB",
        type = "gdb",
        request = "launch",
        program = "${workspaceFolder}/build/sfa_gfx",
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        args = {},
    }
}

