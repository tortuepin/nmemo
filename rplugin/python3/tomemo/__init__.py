import neovim

@neovim.plugin
class SyncSimpleNote(object):
    
    def __init__(self, nvim):
        self.nvim = nvim

    @neovim.function("_SyncSimpleNote", sync=True)
    def testfunction(self, args):
        self.nvim.command("echo 'Sync!!!'")
        return 3


