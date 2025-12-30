import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_fonts.dart';
import 'package:bcs_insight_notes/src/core/navigation/navigation_cubit.dart';
import 'package:bcs_insight_notes/src/core/router/app_router.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/app_bar/in_app_bar.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/drawer/in_end_drawer.dart';
import 'package:bcs_insight_notes/src/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (_) => NavigationCubit())
      ],
      child: Builder(
        builder: (context) {
        final navigationCubit = context.read<NavigationCubit>();

        return MaterialApp.router(
          title: 'InsightNotes',
          debugShowCheckedModeBanner: false,
          routerConfig: createRouter(navigationCubit),
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
            ),
          );
        }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: InEndDrawer(),
      appBar: InAppBar(
        title: 'InsightNotes',
        bgColor: AppColors.appBarBackgroundColor,
        fontFamily: AppFonts.anton,
        iconBgColor: AppColors.buttonTransparentColor,
        iconFgColor: AppColors.bgSecondaryColor,
        onPressed: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      body: Homepage(),
    );
  }
}
