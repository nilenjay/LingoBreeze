import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'core/dependency_injection/injection_container.dart' as di;
import 'features/vocabulary/presentation/bloc/vocabulary_bloc.dart';
import 'features/vocabulary/presentation/bloc/vocabulary_event.dart';
import 'features/vocabulary/presentation/pages/vocabulary_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const VocabularyPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<VocabularyBloc>()..add(LoadWords()),
      child: MaterialApp.router(
        title: 'LingoBreeze',
        theme: AppTheme.lightTheme,
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
