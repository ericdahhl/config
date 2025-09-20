# The setup

## Install nix

```bash
# Recommended: multi-user (daemon) install
sh <(curl -L https://nixos.org/nix/install) --daemon
```
Restart shell and verify
```bash
nix --version
nix --extra-experimental-features 'nix-command flakes' --version
```
## Bootstrap
```bash
nix run --experimental-features 'nix-command flakes' home-manager/master -- switch --flake .#eric-mac --extra-experimental-features 'nix-command flakes' # or .#eric-linux if on linux
```

## Daily use
```bash
nix flake update
home-manager switch --flake .#eric-mac
```

```bash
# Try it once (no install):
nix run nixpkgs#toolname
# Runs the tool directly. When you exit, it’s gone.

# Temporary shell (multiple tools, env testing):
nix shell nixpkgs#tool1 nixpkgs#tool2
# Gives shell with them available until you exit.

# Keep it around without editing flake yet:
nix profile install nixpkgs#toolname
```
