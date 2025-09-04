# The setup

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

