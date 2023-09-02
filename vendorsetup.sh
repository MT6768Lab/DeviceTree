# Hardcode High Memory Parallel Process
export NINJA_HIGHMEM_NUM_JOBS=1

# GMS Partition Size Enabler
export WITH_GMS=true

# Media: Import extractor changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/0fce53bdf414efc4fa42c5bccab20eafb97816c9.patch")"

# begonia: media: libstagefright: Limit max width/height to display size
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/7e5ed12f933dd5c0b43b54e588cdc0e6ee39dd2d.patch")"

# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/fd880bdb6742564e6567fea55949117ee5cdfbbd.patch")"

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/4cdfda973cdb4e5a283fe57c5e6491f766c287c6.patch")"

# REThreaded: Use gen- and delete- textures on all render engines
git -C "frameworks/native" am <<<"$(curl -sL "https://github.com/begonia-dev/android_frameworks_native/commit/16eb76b5b1aa021dc3f00852c50a2f1fcf282088.patch")"

# Sign support
# config: Conditionally enable dev keys signing
git -C "vendor/pb" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_vendor_pb/commit/e9bd4b7cdbf65f9d1047c5153204631f953f080e.patch")"

# config/version: PRODUCT_VERITY_SIGNING_KEY is deprecated
git -C "vendor/pb" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_vendor_pb/commit/31dfc184ba51c9cb2e753dffd8fbc04c7461d310.patch")"

# signing: support inline signing for U [2/2]
git -C "vendor/pb" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_vendor_pb/commit/830f32340c57eab63ae7b36365bd04be2a924e08.patch")"

# version: Sign every build variant but eng
git -C "vendor/pb" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_vendor_pb/commit/e4b64fd5e07190f969ec2373de6bd4cd6ee164b6.patch")"

# allowlists: support inline signing for U [1/2]
git -C "build/soong" am <<<"$(curl -sL "https://github.com/orkunsdumps/pb_build_soong/commit/ba4498ee50abd521e09d7b03a4c39f54dadd5c3e.patch")"

# Get keys
cd vendor/pb/signing/keys
wget -O keys.tar https://drive.orkunergun.eu.org/api/raw/?path=/DerpFest-AOSP/Keys/keys.tar
tar xvf keys.tar
rm -rf keys.tar
cd -