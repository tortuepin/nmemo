import neovim

@neovim.plugin
class TestPlugin(object):
    
    def __init__(self, nvim):
        self.nvim = nvim

    @neovim.function("TestFunction", sync=True)
    def testfunction(self, args):
        self.nvim.command("echo 'aiai'")
        return 3

