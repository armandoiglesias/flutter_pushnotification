import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  final _mensajeStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajes => _mensajeStreamController.stream; 

  dispose(){
    _mensajeStreamController?.close();
  }

  initNotification(){
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){
      print(token);
    });

    _firebaseMessaging.configure(

      onMessage: ( info) async{
        print("=== OnMessage ===");
        print(info);

        String argumento = "no-data";
        if( Platform.isAndroid ){
          argumento = info["data"]["comida"] ?? "no-data"; 
        }else{
          argumento = info["comida"] ?? "no-data"; 
        }

        _mensajeStreamController.sink.add(argumento);
      },
      onLaunch: (info) async{
        print("=== OnLaunch ===");
        print(info);

        

      },
      onResume: (info) async {
        print("=== OnResume ===");
        print(info);

        String argumento = "no-data";
        if( Platform.isAndroid ){
          argumento = info["data"]["comida"] ?? "no-data"; 
        }else{
          argumento = info["comida"] ?? "no-data"; 
        }

        _mensajeStreamController.sink.add(argumento);
      }

    );

  }



}
