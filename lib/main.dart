import 'package:ekaksha/app_blocs.dart';
import 'package:ekaksha/app_events.dart';
import 'package:ekaksha/pages/%20sign_in/sign_in.dart';
import 'package:ekaksha/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ekaksha/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   lazy: true,
    //   create: (context) => WelcomeBloc(),
    //   child: ScreenUtilInit(
    //     builder: (context, child) => const MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: WelcomePage(),
    //     ),
    //   ),
    // );
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            // lazy: true,
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            create: (context) => AppBlocs(),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  elevation: 0, backgroundColor: Colors.white),
            ),
            home: const WelcomePage(),
            routes: {
              "myHomePage": (context) => const MyHomePage(),
              "signIn": (context) => const SignIn(),
            },
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter demo homepage"),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "heroTAg1",
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "heroTAg2",
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
