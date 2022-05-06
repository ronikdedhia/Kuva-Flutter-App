import 'package:flutter/material.dart';
import 'package:kuva/SpashScreen.dart';
import './dummy_data.dart';
import './screen/tabs_screen.dart';
import './screen/affirmation_detail_screen.dart';
import './screen/category_affirmation_screen.dart';
import './screen/login.dart';
import 'screen/signup.dart';
import './screen/categories_screen.dart';
import './models/affirmations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  binding();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

binding() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('codex_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });
}

class _MyAppState extends State<MyApp> {
  @override
  List<Affirmations> _availableAffirmations = DUMMY_Affirmations;
  List<Affirmations> _favoriteAffirmations = [];

  void _toggleFavorite(String affId) {
    final existingIndex =
        _favoriteAffirmations.indexWhere((aff) => aff.id == affId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteAffirmations.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteAffirmations.add(
          DUMMY_Affirmations.firstWhere((meal) => meal.id == affId),
        );
      });
    }
  }

  bool _isAffFavorite(String id) {
    return _favoriteAffirmations.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuva',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.dark().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),

      initialRoute: '/splash', // default is '/'

      routes: {
        '/splash': (context) => SScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/': (ctx) => TabsScreen(),
        CategoryAffirmationScreen.routeName: (ctx) =>
            CategoryAffirmationScreen(_availableAffirmations),
        AffirmationDetailScreen.routeName: (ctx) =>
            AffirmationDetailScreen(_toggleFavorite, _isAffFavorite),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
