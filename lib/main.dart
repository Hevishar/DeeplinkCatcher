import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        String? fullPath = state.uri.toString();
        return DetailScreen(fullPath: fullPath);
      },
    ),
    GoRoute(
      path: '/initTransactionQR', // Define a route with a parameter
      builder: (context, state) {
        String? fullPath = state.fullPath;
        return DetailScreen(fullPath: fullPath);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router, // Use routerConfig for GoRouter
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deeplink with GoRouter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                // Example of navigating using GoRouter
                context.go('/details/456');
              },
              child: const Text('Go to Detail 456'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String? fullPath;

  const DetailScreen({super.key, this.fullPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Full Path: $fullPath'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (fullPath != null) {
                  Clipboard.setData(ClipboardData(text: fullPath ?? ''));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Copied to clipboard!')),
                  );
                }
              },
              child: const Text('Copy Full Path'),
            ),
          ],
        ),
      ),
    );
  }
}
