import 'package:farmkenya/screens/Landing/LandingPageScreen.dart';
import 'package:farmkenya/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
bool firstTime = true;
// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final titleProvider = Provider((_) => 'Products');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //this ensures that the splash screen appears when the app is opened
  FlutterNativeSplash.removeAfter(initialization);
  //we will use shared prefernces to store user data s as to know if it's heir first time in the app
  final prefs = await SharedPreferences.getInstance();
  firstTime =  prefs.getBool('ON_BOARDING')?? true;
  runApp(ProviderScope(child:  MyApp()));
}
//this function is for the splash screen
Future initialization(BuildContext? context) async{
//  load resources
await Future.delayed(const Duration(seconds:3));
}
// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref){
  final String appBarTitle = ref.watch(titleProvider);
    return MaterialApp(
        localizationsDelegates: const [
          // this line is important
        ],
        supportedLocales: const [
          const Locale('en'),
          const Locale('zh'),
        ],

      title: 'Farm Kenya',
        debugShowCheckedModeBanner: false,
      //we are using the flex color scheme to generate a predefined theme
      theme: FlexThemeData.light(scheme: FlexScheme.green),
        // To use a pre-defined color scheme, don't assign any FlexSchemeColor to
// `colors`, instead pick a FlexScheme and assign it to the `scheme` property.
// Try eg the new "Blue Whale" color scheme.
//         const FlexScheme _scheme = FlexScheme.blueWhale;


    themeMode: ThemeMode.system,
      home:  firstTime?OnBoardingScreen():const LandingPageScreen()
    );
  }
}
