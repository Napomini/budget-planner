import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'modules/check_logIn_status/check_login_status.dart';

void main() async {
  //An asynchronous function is a function that can perform operations concurrently
  //with the rest of the program, allowing it to execute tasks without waiting
  //for each one to complete before moving on to the next.

  WidgetsFlutterBinding.ensureInitialized();
  // Ensures that Firebase has been initialized
  //connects the UI code with the engine.
  await Firebase.initializeApp(
    //initializing firebase.
    options: DefaultFirebaseOptions.currentPlatform,
    //optional requirement.
    /*When you initialize Firebase in your Flutter app, you typically 
    need to provide configuration options, such as API keys, database URLs, 
    and other settings. Instead of manually specifying these options for each platform, 
    DefaultFirebaseOptions.currentPlatform allows you to obtain the default options 
    based on the platform the app is running on. */
  );
  runApp(const MyApp());
  //MyApp() is likely a custom widget class that represents the root of your
  //application's widget tree.
  //runApp() is a function provided by Flutter that takes a widget as an
  //argument and starts the Flutter application.
}

class MyApp extends StatelessWidget {
  //widget name MyApp
  const MyApp({super.key});
  // constructor name MyApp, const means properties cannot be changed after they are created
  // This widget is the root of your application.
  /*{super.key}: This part defines a parameter named key which is being
  passed to the constructor of the superclass (StatelessWidget or Widget). 
  In Flutter, key is used to uniquely identify widgets, 
  which can be useful for managing state or for performance optimizations. */
  @override
  // This is an annotation used in Dart to indicate that a method
  //is overriding a method from its superclass.
  Widget build(BuildContext context) {
    /*In Flutter, every widget must implement a method called build(BuildContext context). 
    This method is responsible for describing the part of the user-interface 
    represented by the widget. */
    //Widget=return type
    //build()=method
    //BuildContext=parameter-type
    //context=parameter
    return MaterialApp(
      //MaterialApp() Widget=provided by Flutter to set up the material design style.
      //It is typically used as the root widget of a Flutter app.
      theme: ThemeData(
        //theme: property=customize the visual appearance of various UI elements.
        //ThemeData() class=holds the configuration settings for a theme.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //colorScheme: property=colors for such as primary color,background, error, etc.
        //ColorScheme.fromSeed()=ColorScheme is a ClassName and fromSeed() is a method.
        //seedColor:=parameter that derives the color deepPurple from colors.

        useMaterial3: true,
        //useMaterial3: property=to use Material Design 3. Material Design 3
        // is an evolution of the original Material Design.
      ),
      debugShowCheckedModeBanner: false,
      //The debugShowCheckedModeBanner property is used to control the display of the
      //"DEBUG" banner that appears on the screen when the app is running in debug mode.
      home: const CheckLogInStatus(),
      // home: const LogInPage(),

      //Imagine your app is a house.
      //The home property is like saying, This is the main room where everything starts.
      //The CheckLogInStatus() is like inviting a special guest,
      //which is a widget called CheckLogInStatus, to be in that main room.
      //The const before CheckLogInStatus() is like saying, "This guest won't change.
    );
  } //build
} //statelessWidget
