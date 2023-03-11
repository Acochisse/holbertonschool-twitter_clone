import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/app_state.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/widgets/side_bar_menu.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/chats_screen.dart';
import 'package:twitter/widgets/side_bar_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<Auth>(create: (_) => Auth()),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            case '/search':
              return MaterialPageRoute(builder: (_) => SearchScreen());
            case '/notifications':
              return MaterialPageRoute(builder: (_) => const NotificationsScreen());
            case '/chats':
              return MaterialPageRoute(builder: (_) => const ChatsScreen());
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
        },
        initialRoute: '/',
        home: const Scaffold(
          body:  SignIn(),
        drawer:  SideBarMenu(),
        bottomNavigationBar: BottomMenuBar(),
        ),
      ),
    );
  }
}
