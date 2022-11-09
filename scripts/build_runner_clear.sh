if [[ $1 != "" && $1 == "fvm" ]]
then
fvm flutter packages pub run build_runner watch --delete-conflicting-outputs
else
flutter packages pub run build_runner watch --delete-conflicting-outputs
fi