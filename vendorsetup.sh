# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/begonia-dev/android_frameworks_av/commit/aea147e1f59ba5654f8e11b781a41032a402d442.patch")"

# [SQUASH] media: Import extractor changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/begonia-dev/android_frameworks_av/commit/1bbb10bc0cb3af37af9dde1fadbc099e43ff6c20.patch")"

# [SQUASH] media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/begonia-dev/android_frameworks_av/commit/15d0f5f564421a237a23de3f348c050e25f8faf9.patch")"

# begonia: media: libstagefright: Limit max width/height to display size
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/begonia-dev/android_frameworks_av/commit/953e08183c09e4e021ba8407fc733c93dd578054.patch")"

# Revert "screenrecord: get codec capabilities & limit frame rate configuration"
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/cr_frameworks_av/commit/82ec56477d62b0fb9470f81cb034591081102b3d.patch")"

# Revert "Use encoder capabilities for determining screenrecording size"
git -C "frameworks/base" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_base/commit/9b90d58c43e17ba036de726cafe7d4bf838be01a.patch")"

# REThreaded: Use gen- and delete- textures on all render engines
git -C "frameworks/native" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_native/commit/1e483eea5cf3b4972939a313652aebac42a1561c.patch")"