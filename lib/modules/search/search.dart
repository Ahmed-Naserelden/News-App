// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/status.dart';
import '../../shared/components/components.dart';

var searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          var list = cubit.searchList;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(

                    controller: searchController,
                    onchange: (value) {
                      cubit.getSearch(value);
                    },
                    text: 'Search',
                    textInputType: TextInputType.text,
                    prefixicon: const Icon(Icons.abc),
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    contexti: context,
                  ),
                ),
                Expanded(child: NewsScreenContent(state is! NewsGetSearchLoadingState, list,context))
              ],
            ),
          );
        });
  }
}