--- ../slimserver-vendor-1a6dc7/CPAN/buildme.sh.orig	2018-04-11 08:51:55.360230000 +0100
+++ ../slimserver-vendor-1a6dc7/CPAN/buildme.sh	2018-04-11 08:52:15.289491000 +0100
@@ -696,7 +696,7 @@
                 tar_wrapper zxf icu4c-58_2-src.tgz
                 cd icu/source
                 # Need to patch ICU to adapt to removal of xlocale.h on some platforms.
-                patch -p0 < ../../icu58_patches/digitlst.cpp.patch
+                # DONT DO THIS patch -p0 < ../../icu58_patches/digitlst.cpp.patch
                 . ../../update-config.sh
                 if [ "$OS" = 'Darwin' ]; then
                     ICUFLAGS="$FLAGS $OSX_ARCH $OSX_FLAGS -DU_USING_ICU_NAMESPACE=0 -DU_CHARSET_IS_UTF8=1" # faster code for native UTF-8 systems
