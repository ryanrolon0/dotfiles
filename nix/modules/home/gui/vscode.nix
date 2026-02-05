{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        ms-python.python
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode-remote.remote-ssh
      ];
      userSettings = {
        "telemetry.telemetryLevel" = "off";
        "files.autoSave" = "afterDelay";
        "chat.disableAIFeatures" = true;
        "editor.fontSize" = 14;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "terminal.integrated.fontFamily" =  "'FiraCode Nerd Font Mono'";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.initialHint" = false;
        "workbench.startupEditor" = "none";
      };
    };
  };
}