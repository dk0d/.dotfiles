return {
    "goolord/alpha-nvim",
    opts = function(_, opts)
        local logo = [[
██████╗ ██████╗  ██████╗
██╔══██╗╚════██╗██╔════╝
██║  ██║ █████╔╝██║
██║  ██║ ╚═══██╗██║
██████╔╝██████╔╝╚██████╗
╚═════╝ ╚═════╝  ╚═════╝

      [ d3c.ai ]
        ]]
        opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
    end
}
