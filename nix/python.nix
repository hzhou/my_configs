let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {allowUnfree = true;}; overlays = []; };
in

pkgs.mkShell {
  packages = with pkgs; [
    python3
  ];

  shellHook = ''
    export PS1='\n\[\033[1;32m\][python:\w]\$\[\033[0m\] '
  '';
}
