let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (packages: [
        packages.pandas
        packages.requests
      ]))
    ];
  }
