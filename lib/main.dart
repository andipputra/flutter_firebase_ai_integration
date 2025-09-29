import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai_integration/data/repositories/recipe_repository.dart';
import 'package:flutter_ai_integration/firebase_options.dart';
import 'package:flutter_ai_integration/presentation/provider/recipe_provider.dart';
import 'package:flutter_ai_integration/presentation/view/home_page.dart';
import 'package:flutter_ai_integration/services/ai_service.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AiService()),
        Provider(
          create: (context) => RecipeRepository(context.read<AiService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeNotifier(context.read<RecipeRepository>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(child: const MaterialApp(home: HomePage()));
  }
}
