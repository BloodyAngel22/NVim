local config = {
    cmd = {'/home/linuxbrew/.linuxbrew/Cellar/jdtls/1.27.1/libexec/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
