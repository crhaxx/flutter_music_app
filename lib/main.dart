import 'package:flutter/material.dart';
import 'package:flutter_music_app/models/playlist_provider.dart';
import 'package:flutter_music_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/home_page.dart';

void main() async {
  //Note: supabase setup
  await Supabase.initialize(
    url: "https://hqhpvcqyjdmwfjjeiksm.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhxaHB2Y3F5amRtd2ZqamVpa3NtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYxNTM3ODMsImV4cCI6MjA1MTcyOTc4M30.yxUNu7XiSc3I7tzhezYdhCj41OmFJ2y8t-FArDDgm3Y",
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
