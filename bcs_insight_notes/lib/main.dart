import 'package:bcs_insight_notes/src/core/constants/app_colors.dart';
import 'package:bcs_insight_notes/src/core/constants/app_fonts.dart';
import 'package:bcs_insight_notes/src/core/shared_widgets/app_bar/in_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InsightNotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Insight Notes'),
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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: InAppBar(
        title: 'InsightNotes',
        bgColor: AppColors.appBarBackgroundColor,
        fontFamily: AppFonts.anton,
        iconBgColor: AppColors.buttonTransparentColor,
        iconFgColor: AppColors.bgSecondaryColor,
        onPressed: () {},
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.appBarBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s note your thoughts...',
                  style: TextStyle(
                    fontFamily: AppFonts.oswald,
                    fontSize: 24,
                    color: AppColors.bgSecondaryColor,
                    letterSpacing: 2.0
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgSecondaryColor,
                        foregroundColor: AppColors.bgColor,
                        textStyle: TextStyle(
                          fontFamily: AppFonts.oswald,
                          fontSize: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text('All'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.bgSecondaryColor,
                        textStyle: TextStyle(
                          fontFamily: AppFonts.oswald,
                          fontSize: 16,
                        ),
                        side: BorderSide(
                          color: AppColors.bgSecondaryColor,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text('Notes'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.bgSecondaryColor,
                        textStyle: TextStyle(
                          fontFamily: AppFonts.oswald,
                          fontSize: 16,
                        ),
                        side: BorderSide(
                          color: AppColors.bgSecondaryColor,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text('List'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Let\'s get started with Insight Notes!',
              style: TextStyle(fontFamily: AppFonts.oswald, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
