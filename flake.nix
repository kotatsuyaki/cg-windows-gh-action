{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-21.11;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            clang-tools
            clang_14
            llvm_14
            llvmPackages_14.libstdcxxClang

            glfw3

            bear
            gnumake
            cmake
          ];
        };
      });
}

