import 'package:comm_safe/screens/screens.dart';
import 'package:comm_safe/services/post_service.dart';
import 'package:comm_safe/services/services.dart';
import 'package:comm_safe/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => PostService(),
        )

      ],


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Post Robos',
        initialRoute: 'home',
        routes: {
          'login': (_) => LoginScreen(),
          'register': (_) => RegisterScreen(),
          'home': (_) => HomeScreen(),
        },
        theme: mitema,
      ),
    );
  }
}
