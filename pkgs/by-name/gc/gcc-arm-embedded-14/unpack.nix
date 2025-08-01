{
  platform,
  pname,
  src,
  stdenv,
  version,
}:

stdenv.mkDerivation {
  inherit version platform src;
  pname = pname + "-unpacked";

  dontConfigure = true;
  dontBuild = true;
  dontPatchELF = true;
  dontStrip = true;
  dontFixup = true;
  dontPatch = true;

  installPhase = ''
    mkdir -p $out
    cp -r * $out
    # these binaries require ancient Python 3.8 not available in Nixpkgs
    rm $out/bin/{arm-none-eabi-gdb-py,arm-none-eabi-gdb-add-index-py} || :
  '';
}
