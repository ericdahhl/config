{
  description = "Eric's dev environment (macOS & Linux)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # pin for reproducibility
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Optional: enable nix-darwin for macOS system integration
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }:
  let
    mkPkgs = system: import nixpkgs { inherit system; config.allowUnfree = true; };
    mkHome = { system, username, homeModule }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = mkPkgs system;
        modules = [ homeModule ];
      };
  in
  {
    # Home Manager configs (works on both macOS and Linux)
    homeConfigurations."eric-linux" =
      mkHome { system = "x86_64-linux"; username = "eric"; homeModule = ./linux.nix; };

    homeConfigurations."eric-mac" =
      mkHome { system = "aarch64-darwin"; username = "eric"; homeModule = ./mac.nix; };

    # Optional: full macOS system config (nix-darwin)
    darwinConfigurations."erics-mac" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin/config.nix
        home-manager.darwinModules.home-manager
        { users.users.eric = { home = "/Users/eric"; }; }
        { home-manager.users.eric = import ./home/mac.nix; }
      ];
    };

    # Dev shells for both platforms (default shell)
    devShells.x86_64-linux.default = let pkgs = mkPkgs "x86_64-linux"; in
      pkgs.mkShell {
        buildInputs = with pkgs; [
          git fzf ripgrep jq yq tmux neovim
          awscli2
          python313
          go_1_23
          nodejs_22 pnpm
          direnv nix-direnv
        ];
        shellHook = ''
          eval "$(direnv hook bash)" 2>/dev/null || true
          eval "$(direnv hook zsh)"  2>/dev/null || true
        '';
      };

    devShells.aarch64-darwin.default = let pkgs = mkPkgs "aarch64-darwin"; in
      pkgs.mkShell {
        buildInputs = with pkgs; [
          git fzf ripgrep jq yq tmux neovim
          awscli2
          python313
          go_1_23
          nodejs_22 pnpm
          direnv nix-direnv
          # macOS niceties:
          coreutils gnugrep gnu-sed
        ];
        shellHook = ''
          eval "$(direnv hook zsh)" 2>/dev/null || true
        '';
      };
  };
}

