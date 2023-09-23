import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psciapp/pages/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:psciapp/services/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
   MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthService())
   ],
   child: const AppWidget(),)
  );
}
