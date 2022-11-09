if [[ $1 != "" && $1 == "bundle" ]]
then
if [[ $2 != "" && $2 == "fvm" ]]
then
fvm flutter build appbundle
else
flutter build appbundle
fi
open build/app/outputs/bundle/release
echo "App Bundle Successfully!"
else
if [[ $2 != "" && $2 == "fvm" ]]
then
fvm flutter build apk
else
flutter build apk
fi
open build/app/outputs/flutter-apk
echo "Apk Successfully!"
fi