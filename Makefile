.PHONY: setup setup_ios setup_all gen gen-watch lint test update_icon update_splash
setup:
	flutter clean
	flutter pub get
setup_ios:
	cd ios && pod install && cd ..
setup_all:
	make setup
	make setup_ios
gen:
	flutter pub run build_runner build --delete-conflicting-outputs
gen_watch:
	flutter pub run build_runner watch --delete-conflicting-outputs
lint:
	flutter analyze
test:
	flutter test
update_icon:
	flutter pub run flutter_launcher_icons:main
update_splash:
	flutter pub run flutter_native_splash:create
build_ios:
	make setup_ios
	flutter build ios
build_android:
	make setup
	flutter build appbundle
