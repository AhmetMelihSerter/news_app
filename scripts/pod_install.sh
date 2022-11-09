if [[ $1 != "" && $1 == "fvm" ]]
then
fvm flutter clean
fvm flutter pub get
else
flutter clean
flutter pub get
fi
cd ios
rm -rf Pods
rm Podfile.lock
if [[ $(uname -m) == 'arm64' ]]
then
arch -x86_64 pod install
else
pod install
fi