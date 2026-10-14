import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/list_screen.dart';
import 'screens/counter_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/list/:categoryId',
      builder: (context, state) {
        final categoryId = state.pathParameters['categoryId']!;
        return ListScreen(categoryId: categoryId);
      },
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterScreen(),
    ),
  ],
);
