{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    nasm
    gcc
    binutils
    qemu
    gnumake
    xorriso
    grub2
  ];

  shellHook = ''
    echo "Welcome to the officerdownOS Nix compile shell!"

    export GRUB_MKRESCUE=${pkgs.grub2}/bin/grub-mkrescue

    if [ ! -d "officerdownOS" ]; then
      echo "Cloning officerdownOS..."
      git clone https://github.com/officerdwn/officerdownOS
    else 
      echo "officerdownOS repo already exists."
    fi
  '';
}
