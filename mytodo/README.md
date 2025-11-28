# mytodo



## Conectando com o Firebase
- crie uma conta no Firebase
- Instale o NodeJs
- Instale Firebase Tools: > npm install -g firebase-tools
- Faça o login: > firebase login
- Ative: > dart pub global activate flutterfire_cli
- Configure: > flutterfire configure
- Instale a dependência: > flutter pub add firebase_core
- Configure o projeto: > flutterfire configure
- Ajuste o main:
```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
```