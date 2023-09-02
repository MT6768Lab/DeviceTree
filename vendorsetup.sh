# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/1fb1c48309cf01deb9e3f8253cb7fa5961c25595.patch")"

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/a727c1f68fd30c8e6a4068db9dc26670d4a78f6c.patch")"

# SF: Bring back support for disabling backpressure propagation
git -C "frameworks/native" am <<<"$(curl -sL "https://github.com/orkunsdumps/lmo_frameworks_native/commit/4529d4fb6b33ce069ddf02897677b478ddf9e3b5.patch")"

# vendor: Allow `backuptool` on user builds
git -C "vendor/lmodroid" am <<<"$(curl -sL "https://github.com/orkunsdumps/platform_vendor_lmodroid/commit/f58926334a92d85dad6ef9689968ea7a6b3e9e86.patch")"

# build_make
cd build/make
git fetch https://github.com/orkunsdumps/platform_build thirteen
git cherry-pick b24e0bfbdd526f6a875b37fce5781fa63e1fcace
git cherry-pick 7676e2d9d4a476563bb5c5d5dffa3fe076e93c9d
cd -

# build_soong
cd build/soong
git fetch https://github.com/orkunsdumps/platform_build_soong thirteen
git cherry-pick 0f27872c804dae52ca69a8e10c39b725bb694cac
git cherry-pick 0f27872c804dae52ca69a8e10c39b725bb694cac..e4fa53cea193ce9f06b113a297831c29a3c204ae
cd -