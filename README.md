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
cd nix

home-manager switch --flake .#eric-mac  # or .#eric-linux if on linux
```

## Daily use
```bash
cd nix

nix flake update
home-manager switch --flake .#eric-mac
```

