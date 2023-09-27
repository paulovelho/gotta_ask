# Gotta Ask

My first flutter experiment =)


## database files generation
generate with `dart run build_runner build`
keep dev with `dart run build_runner watch`


## generating android assets
for splash screen:
`dart run flutter_native_splash:create`
for app icons:
`dart run flutter_launcher_icons`

## generating Android App:
get your `.keystore` file (it's not here, for security reasons)

to check the alias the keystore file uses, run `keytool -v -list -keystore platypus.keystore`
create the `key.properties` file inside `android` folder (there's a sample, quite easy)
to change app name and id: https://stackoverflow.com/a/51550358/22647495

run with `flutter buld appbundle`
generated app will be at `.../build/app/outputs/bundle/release`





