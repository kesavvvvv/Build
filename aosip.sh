sudo apt-get update && sudo apt-get upgrade
pip install PyDrive
git clone https://github.com/akhilnarang/scripts

cd scripts
bash setup/android_build_env.sh

cd ..
mkdir -p ~/bin
mkdir -p bin
mkdir -p android/aosip
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
curl https://storage.googleapis.com/git-repo-downloads/repo > bin/repo
chmod a+x ~/bin/repo
chmod a+x bin/repo

clear

cd android/aosip

git config --global user.email "kesavr1999@gmail.com"
git config --global user.name "kesavvvvv"

repo init -u git://github.com/AOSiP/platform_manifest.git -b pie && repo sync -f --force-sync --no-tags --no-clone-bundle -j16

clear

git clone https://github.com/kesavvvvv/kernel_asus_sdm660-1 -b lineage-16.0 kernel/asus/sdm660
git clone https://github.com/kesavvvvv/device_asus_X00T -b lineage-16.0 device/asus/X00T
git clone https://github.com/kesavvvvv/proprietary_vendor_asus -b pie vendor/asus

cd external/ant_wireless
rm -rf ant_native
git clone https://github.com/kesavvvvv/ant_native

cd ..
cd ..

clear

export USE_CCACHE=1
prebuilts/misc/linux-x86/ccache/ccache -M 50G
export CCACHE_COMPRESS=1

source build/envsetup.sh && lunch aosip_X00T-userdebug && time mka kronic

clear
