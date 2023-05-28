// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/search/search.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/status.dart';


class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    navigatTo(context, SearchScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                ),
              ],
            ),
            body: cubit.screens[
            cubit.currentIndex], //cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 500.0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        });
  }
}