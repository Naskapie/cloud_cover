[1mdiff --git a/android/app/src/main/AndroidManifest.xml b/android/app/src/main/AndroidManifest.xml[m
[1mindex 7f47218..01ccd1f 100644[m
[1m--- a/android/app/src/main/AndroidManifest.xml[m
[1m+++ b/android/app/src/main/AndroidManifest.xml[m
[36m@@ -1,5 +1,7 @@[m
 <manifest xmlns:android="http://schemas.android.com/apk/res/android"[m
     package="co.appbrewery.clima">[m
[32m+[m[41m    [m
[32m+[m[32m    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />[m
 [m
     <!-- io.flutter.app.FlutterApplication is an android.app.Application that[m
          calls FlutterMain.startInitialization(this); in its onCreate method.[m
[1mdiff --git a/ios/Runner/Info.plist b/ios/Runner/Info.plist[m
[1mindex a8da75c..989594a 100644[m
[1m--- a/ios/Runner/Info.plist[m
[1m+++ b/ios/Runner/Info.plist[m
[36m@@ -2,6 +2,8 @@[m
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">[m
 <plist version="1.0">[m
 <dict>[m
[32m+[m	[32m<key>NSLocationWhenInUseUsageDescription</key>[m
[32m+[m	[32m<string>This app needs access to location when open.</string>[m
 	<key>CFBundleDevelopmentRegion</key>[m
 	<string>en</string>[m
 	<key>CFBundleExecutable</key>[m
[1mdiff --git a/lib/screens/loading_screen.dart b/lib/screens/loading_screen.dart[m
[1mindex 0b96a2a..3c87a55 100644[m
[1m--- a/lib/screens/loading_screen.dart[m
[1m+++ b/lib/screens/loading_screen.dart[m
[36m@@ -1,4 +1,5 @@[m
 import 'package:flutter/material.dart';[m
[32m+[m[32mimport 'package:geolocator/geolocator.dart';[m
 [m
 class LoadingScreen extends StatefulWidget {[m
   @override[m
[36m@@ -6,6 +7,12 @@[m [mclass LoadingScreen extends StatefulWidget {[m
 }[m
 [m
 class _LoadingScreenState extends State<LoadingScreen> {[m
[32m+[m[32m  void getLocation() async {[m
[32m+[m[32m    Position position = await Geolocator()[m
[32m+[m[32m        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);[m
[32m+[m[32m    print(position);[m
[32m+[m[32m  }[m
[32m+[m
   @override[m
   Widget build(BuildContext context) {[m
     return Scaffold([m
[36m@@ -13,8 +20,9 @@[m [mclass _LoadingScreenState extends State<LoadingScreen> {[m
         child: RaisedButton([m
           onPressed: () {[m
             //Get the current location[m
[32m+[m[32m            getLocation();[m
           },[m
[31m-          child: Text('Get Location'),[m
[32m+[m[32m          child: Text('Get Location: '),[m
         ),[m
       ),[m
     );[m
[1mdiff --git a/pubspec.lock b/pubspec.lock[m
[1mindex a6b1a2d..3c110a8 100644[m
[1m--- a/pubspec.lock[m
[1m+++ b/pubspec.lock[m
[36m@@ -43,6 +43,13 @@[m [mpackages:[m
       url: "https://pub.dartlang.org"[m
     source: hosted[m
     version: "0.1.2"[m
[32m+[m[32m  equatable:[m
[32m+[m[32m    dependency: transitive[m
[32m+[m[32m    description:[m
[32m+[m[32m      name: equatable[m
[32m+[m[32m      url: "https://pub.dartlang.org"[m
[32m+[m[32m    source: hosted[m
[32m+[m[32m    version: "1.1.1"[m
   fake_async:[m
     dependency: transitive[m
     description:[m
[36m@@ -60,6 +67,27 @@[m [mpackages:[m
     description: flutter[m
     source: sdk[m
     version: "0.0.0"[m
[32m+[m[32m  geolocator:[m
[32m+[m[32m    dependency: "direct main"[m
[32m+[m[32m    description:[m
[32m+[m[32m      name: geolocator[m
[32m+[m[32m      url: "https://pub.dartlang.org"[m
[32m+[m[32m    source: hosted[m
[32m+[m[32m    version: "5.3.1"[m
[32m+[m[32m  google_api_availability:[m
[32m+[m[32m    dependency: transitive[m
[32m+[m[32m    description:[m
[32m+[m[32m      name: google_api_availability[m
[32m+[m[32m      url: "https://pub.dartlang.org"[m
[32m+[m[32m    source: hosted[m
[32m+[m[32m    version: "2.0.4"[m
[32m+[m[32m  location_permissions:[m
[32m+[m[32m    dependency: transitive[m
[32m+[m[32m    description:[m
[32m+[m[32m      name: location_permissions[m
[32m+[m[32m      url: "https://pub.dartlang.org"[m
[32m+[m[32m    source: hosted[m
[32m+[m[32m    version: "2.0.5"[m
   matcher:[m
     dependency: transitive[m
     description:[m
[36m@@ -144,3 +172,4 @@[m [mpackages:[m
     version: "2.0.8"[m
 sdks:[m
   dart: ">=2.6.0 <3.0.0"[m
[32m+[m[32m  flutter: ">=1.12.13+hotfix.6 <2.0.0"[m
[1mdiff --git a/pubspec.yaml b/pubspec.yaml[m
[1mindex 0aa510b..a1bc2d4 100644[m
[1m--- a/pubspec.yaml[m
[1m+++ b/pubspec.yaml[m
[36m@@ -11,6 +11,8 @@[m [mdependencies:[m
     sdk: flutter[m
 [m
   cupertino_icons: ^0.1.2[m
[32m+[m[32m  geolocator: ^5.3.1[m
[32m+[m
 [m
 dev_dependencies:[m
   flutter_test:[m
