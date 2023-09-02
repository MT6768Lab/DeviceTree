# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/1fb1c48309cf01deb9e3f8253cb7fa5961c25595.patch")"

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/a727c1f68fd30c8e6a4068db9dc26670d4a78f6c.patch")"

# REThreaded: Use gen- and delete- textures on all render engines
git -C "frameworks/native" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_native/commit/1e483eea5cf3b4972939a313652aebac42a1561c.patch")"

# soong: Add vendor/lineage-priv/keys to allowlist
git -C "build/soong" am <<<"$(curl -sL "https://github.com/orkunsdumps/pos_build_soong/commit/fe6926aff79729e58573c69988555b397bc2e711.patch")"

# Revert "core: Use 0 compression when creating the target_files package"
git -C "build/make" am <<<"$(curl -sL "https://github.com/orkunsdumps/build/commit/6cd673a32e9cebf554408393233088210f6f91b4.patch")"

# Build patches
cd build/make
git fetch https://github.com/orkunsdumps/platform_build thirteen
git cherry-pick 7676e2d9d4a476563bb5c5d5dffa3fe076e93c9d
cd -

cd build/soong
git fetch https://github.com/orkunsdumps/pos_build_soong thirteen
git cherry-pick 496b73d8f32f58db48d2655092adebba2f65c60e
git cherry-pick 496b73d8f32f58db48d2655092adebba2f65c60e..b01c8e1ba8e1c36cd755a398ba851da196fb2fd5
cd -