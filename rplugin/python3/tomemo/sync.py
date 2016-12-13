import neovim

@neovim.plugin
class SyncSimpleNote(object):

    def __init__(selfm nvim):
        self.nvim = nvim

