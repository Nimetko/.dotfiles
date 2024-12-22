return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            -- <<<<<<< Updated upstream
            "nvim-treesitter/nvim-treesitter",
            'sidlatau/neotest-dart',
            -- =======
            --             "nvim-treesitter/nvim-treesitter",
            --             'sidlatau/neotest-dart',
            --             "Issafalcon/neotest-dotnet",

            -- >>>>>>> Stashed changes
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
                "marilari88/neotest-vitest",
                "nvim-neotest/neotest-plenary",
                'sidlatau/neotest-dart',
            },
            config = function()
                local neotest = require("neotest")
                neotest.setup({
                    adapters = {
                        -- require("neotest-vitest"),
                        -- require("neotest-plenary").setup({
                        --     -- this is my standard location for minimal vim rc
                        --     -- in all my projects
                        --     min_init = "./scripts/tests/minimal.vim",
                        -- }),
                        require('neotest-dart') {
                            command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
                            -- Change it to `fvm flutter` if using FVM
                            -- change it to `dart` for Dart only tests
                            use_lsp = true,      -- When set Flutter outline information is used when constructing test name.
                            -- Useful when using custom test names with @isTest annotation
                            custom_test_method_names = {},
                        },
                        require("neotest-dotnet")
                    }
                })

                vim.keymap.set("n", "<leader>tr", function()
                    neotest.run.run()
                end)
            end,
        },
    }
}


