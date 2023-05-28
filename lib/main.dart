// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mig_41/shared/bloc_observer.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/status.dart';
import 'layout/news_app/news_layout.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // =>

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()),
        BlocProvider(create: (context) => NewsCubit()..start()),
      ],

      child: BlocConsumer<NewsCubit, NewsStatus>(
          listener: (context, status) {},
          builder: (context, status) {
            var cubit = NewsCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false, // to me able to edit

                  iconTheme: IconThemeData(color: Colors.black),

                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),

                  backgroundColor: Colors.white,
                  elevation: 0.0,

                  systemOverlayStyle: SystemUiOverlayStyle(
                    // this related with the above appbar that located in wifi and battery icons that is status bar

                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false, // to me able to edit
                  iconTheme: IconThemeData(color: Colors.white),

                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),

                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,

                  systemOverlayStyle: SystemUiOverlayStyle(
                    // this related with the above appbar that located in wifi and battery icons that is status bar
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20.0,
                  backgroundColor: HexColor('333739'),
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

              ),
              themeMode: cubit.isLight ? ThemeMode.light : ThemeMode.dark,
              home: NewsApp(),
            );
          }),
    );
  }
}