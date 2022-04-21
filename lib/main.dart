import 'package:flutter/material.dart';
import 'package:pay_flow/app_widget.dart';
import 'package:pay_flow/modules/login/login_page.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/*void main() {
 runApp(AppFirebase());
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text("Não foi possível inicializar o Firebase =/",
                  textDirection: TextDirection.ltr),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }

        return Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
