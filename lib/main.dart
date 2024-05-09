import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'auth_screen.dart';
import 'home/main_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Обработка сообщения в фоновом режиме: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Запрос разрешения на отправку push-уведомлений!!!
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Разрешение на отправку push-уведомлений получено');

    // Получение токена устройства
    String? token = await FirebaseMessaging.instance.getToken();
    print('Device Token: $token');

    // Обработка сообщений, когда приложение в фоновом режиме или закрыто
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } else {
    print('Разрешение на отправку push-уведомлений не получено');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Пользователь авторизован, перенаправляем на главный экран
            return const MainScreen();
          } else {
            // Пользователь не авторизован, показываем экран авторизации
            return const AuthScreen();
          }
        },
      ),
    );
  }
}