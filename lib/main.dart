import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc_pattern/cubit/categoryDetailCubit.dart';
import 'package:movie_app_bloc_pattern/cubit/homePageCubit.dart';
import 'package:movie_app_bloc_pattern/screens/homePage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyBfokfgtxyMhkL1iwdQJtqS7sWV28sL9D0",
      appId: "1:566248381906:android:060dafe0bf69f0c2f7fc0b",
      messagingSenderId: "566248381906",
      projectId: "base-applications"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> HomePageCubit()),
        BlocProvider(create: (context)=> CategoryDetailCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

