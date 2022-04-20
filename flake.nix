{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-21.11;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        deps = with pkgs; [
          clang_14
          gnumake
          cmake
          pkg-config
          glfw3
          /* llvm_14
            llvmPackages_14.libstdcxxClang */
        ];
        dev-deps = with pkgs; [
          bear
          clang-tools
        ];
      in
      {
        defaultPackage = pkgs.stdenv.mkDerivation {
          src = ./.;
          name = "cg1";
          buildInputs = deps;
        };
        packages.static = pkgs.pkgsStatic.stdenv.mkDerivation {
          src = ./.;
          name = "cg1";
          buildInputs = with pkgs.pkgsStatic; [
            gnumake
            cmake
            pkg-config
            glfw3
          ];
        };
        devShell = pkgs.mkShell {
          buildInputs = deps ++ dev-deps;
        };
      });
}

