import 'package:flutter/material.dart';
import 'package:push_notification/src/pages/home_page.dart';
import 'package:push_notification/src/pages/mensaje_page.dart';
import 'package:push_notification/src/provider/pushn_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() { 
    super.initState();

    final pushProvider =  PushNotificationProvider();
    pushProvider.initNotification();

    pushProvider.mensajes.listen( (data){
      print("Argumento :: $data");

      navigatorKey.currentState.pushNamed("mensaje", arguments: data);
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Local', 
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home" : (_) => HomePage(),
        "mensaje" : (_) => MensajePage ()
      },
    );
  }
}