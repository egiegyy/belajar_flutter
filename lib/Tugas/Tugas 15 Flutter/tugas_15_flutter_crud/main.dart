import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/view/login_screen.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/view/profile_screen.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/utils/app_session.dart';
import 'package:flutter_application_1/Tugas/Tugas%2015%20Flutter/tugas_15_flutter_crud/utils/app_theme.dart';

class Tugas15FlutterCrudApp extends StatefulWidget {
  const Tugas15FlutterCrudApp({super.key});

  @override
  State<Tugas15FlutterCrudApp> createState() => _Tugas15FlutterCrudAppState();
}

class _Tugas15FlutterCrudAppState extends State<Tugas15FlutterCrudApp> {
  late final Future<void> _sessionFuture;

  @override
  void initState() {
    super.initState();
    _sessionFuture = AppSession.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 15 Flutter CRUD',
      theme: AppTheme.theme,
      home: FutureBuilder<void>(
        future: _sessionFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return AppSession.isLoggedIn
              ? const ProfileScreen()
              : const LoginScreen();
        },
      ),
    );
  }
}
