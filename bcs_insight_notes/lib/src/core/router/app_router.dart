import 'dart:async';

import 'package:bcs_insight_notes/main.dart';
import 'package:bcs_insight_notes/src/core/router/route_paths.dart';
import 'package:bcs_insight_notes/src/pages/create_note_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../navigation/navigation_cubit.dart';
import '../enums/navigation_page.dart';

GoRouter createRouter(NavigationCubit navigationCubit) {
  return GoRouter(
      initialLocation: RoutePaths.home,
      refreshListenable: GoRouterRefreshStream(navigationCubit.stream),
      routes: [
        GoRoute(
          path: RoutePaths.home,
          builder: (_, _) => const MyHomePage(title: "Insight Note from cubit")
        ),
        GoRoute(
          path: RoutePaths.createNote,
          builder: (_, _) => const CreateNotePage()
        ),
      ],
    redirect: (_, _) {
        switch (navigationCubit.state) {
          case NavigationPage.home:
            return RoutePaths.home;
          case NavigationPage.createNote:
            return RoutePaths.createNote;
        }
    }
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen(
        (_) => notifyListeners(),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}