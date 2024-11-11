import 'imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 891),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(fontFamily: "Nunito"),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          MoodStatisticsPage.routName: (context) => MoodStatisticsPage(),
          CalendarPage.routName: (context) => const CalendarPage()
        },
      ),
    );
  }
}
