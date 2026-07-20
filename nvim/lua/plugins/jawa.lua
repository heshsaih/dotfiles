return {
    "nvim-java/nvim-java",
    config = function (_, opts)
        require('java').setup()
    end
}
