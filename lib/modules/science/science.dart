import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/status.dart';
import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        return NewsScreenContent(
            state is! NewsGetScienceLoadingState, NewsCubit.get(context).science, context);
      },
    );
  }
}