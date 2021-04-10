{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation rec {
  name = "droidcam-obs-plugin";
  src = pkgs.fetchFromGitHub {
    owner = "dev47apps";
    repo = name;
    rev = "21f07a1c49227beebb3d294e0806b2ab6f2df897";
    sha256 = "15fdbkd1i1yy9nmspsi335a6yn49r9c2wxs8y4k5x5gy0hzl6031";
  };
  patches = [ (pkgs.writeText "0001-lib64-to-lib.patch" ''
diff --git a/Makefile b/Makefile
index 32cdec4..b36e70b 100644
--- a/Makefile
+++ b/Makefile
@@ -29,14 +29,6 @@ all: $(LIB_DLL)
 UNAME := $(shell uname -s)
 ifeq ($(UNAME),Linux)
 ## LINUX ##
-	JPEG_DIR ?= /opt/libjpeg-turbo
-	JPEG_LIB  = $(JPEG_DIR)/lib$(shell getconf LONG_BIT)
-
-	STATIC   += $(JPEG_LIB)/libturbojpeg.a
-	INCLUDES += -I$(JPEG_DIR)/include
-	INCLUDES += -I/usr/include/obs
-	LDD_LIBS += -lobs
-	LDD_LIBS += -lusbmuxd
 	LDD_FLAG += -shared
 
 run:
  '') ];
  buildInputs = with pkgs; [
    libjpeg_turbo.out
    libjpeg_turbo.dev
    libusbmuxd
    obs-studio
    ffmpeg
    (pkgs.runCommand "obs-lib" {} ''
      mkdir -p $out
      ln -s ${pkgs.obs-studio}/include/obs $out/include
    '')
  ];
  preBuild = ''
    mkdir build
  '';
  installPhase = ''
    path="$out/share/obs/obs-plugins/droidcam-obs"
    mkdir -p "$path"
    mv build "$path/bin"
    mv data "$path/"
  '';
}
