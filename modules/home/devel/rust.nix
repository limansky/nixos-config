{ pkgs, ...}:{
  home.packages = with pkgs; [
    cargo
    rustfmt
    rustc
    rust-analyzer
    clippy
    clang
  ];
}
