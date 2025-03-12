import 'package:cooking_book/root_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    ProviderScope(
      child: const CookingBookApp(),
    ),
  );
}

class CookingBookApp extends StatelessWidget {
  const CookingBookApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.grey.shade50,
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme().copyWith(
          titleLarge: GoogleFonts.openSans(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        cardTheme: CardTheme(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        chipTheme: ChipThemeData(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        listTileTheme: ListTileThemeData(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 0.2,
            ),
          ),
        ),
      ),
      home: RootApp(),
    );
  }
}
