{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
      ];
      keybindings = [
        # Create new file in file explorer
        {
          "key"= "a";
          "command"= "explorer.newFile";
          "when"= "explorerViewletVisible && filesExplorerFocus && !inputFocus";
        }
        # Create new folder in file explorer
        {
          "key"= "shift+a";
          "command"= "explorer.newFolder";
          "when"= "explorerViewletVisible && filesExplorerFocus && !inputFocus";
        }
        # Rename file or folder in file explorer
        {
          "key"= "r";
          "command"= "renameFile";
          "when"= "explorerViewletVisible && filesExplorerFocus && !inputFocus";
        }
        # Delete file or folder in file explorer
        {
          "key"= "d";
          "command"= "deleteFile";
          "when"= "explorerViewletVisible && filesExplorerFocus && !inputFocus";
        }
        # Exit file explorer
        {
          "key"= "ctrl+l";
          "command"= "workbench.action.focusFirstEditorGroup";
          "when"= "filesExplorerFocus && vim.active && vim.mode != 'Insert'";
        }
        # Enter file explorer
        {
          "key"= "ctrl+h";
          "command"= "workbench.explorer.fileView.focus";
          "when"= "editorTextFocus && vim.active && vim.mode != 'Insert'";
        }
        # Run Java file
        {
          "key"= "ctrl+enter";
          "command"= "java.debug.runJavaFile";
        }
        {
          "key"= "ctrl+p";
          "command"= "-workbench.action.quickOpenNavigateNextInFilePicker";
          "when"= "inFilesPicker && inQuickOpen";
        }
        {
          "key"= "ctrl+p";
          "command"= "-extension.vim_ctrl+p";
          "when"= "editorTextFocus && vim.active && vim.use<C-p> && !inDebugRepl || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'CommandlineInProgress' || vim.active && vim.use<C-p> && !inDebugRepl && vim.mode == 'SearchInProgressMode'";
        }
        {
          "key"= "ctrl+j";
          "command"= "workbench.action.terminal.toggleTerminal";
          "when"= "!terminalFocus";
        }
        {
          "key"= "ctrl+k";
          "command"= "workbench.action.focusActiveEditorGroup";
          "when"= "terminalFocus";
        }
        {
          "key"= "ctrl+/";
          "command"= "editor.action.inlineSuggest.trigger";
          "when"= "editorTextFocus && !editorHasSelection && !inlineSuggestionsVisible";
        }
        {
          "key"= "alt+\\";
          "command"= "-editor.action.inlineSuggest.trigger";
          "when"= "editorTextFocus && !editorHasSelection && !inlineSuggestionsVisible";
        }
        {
          "key"= "ctrl+enter";
          "command"= "code-runner.run";
        }
        {
          "key"= "ctrl+alt+n";
          "command"= "-code-runner.run";
        }
      ];
    };
  };
}
