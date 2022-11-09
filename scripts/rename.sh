if [[ $1 != "" && $2 != "" && $3 != "" ]]
then
flutter pub global run rename --bundleId com.$1.$2
flutter pub global run rename --appname "$3",
echo "App Rename Successfully!"
else
echo "Command Not Working"
echo "\$1 = Company Name"
echo "\$2 = App Id"
echo "\$3 = App Name"
fi