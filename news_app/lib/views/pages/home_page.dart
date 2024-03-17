import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/utils/route/app_routes.dart';
import 'package:news_app/view_models/home_cubit/home_cubit.dart';
import 'package:news_app/views/widgets/custom_carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.searchRoute);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            bloc: cubit,
            buildWhen: (prev, current) =>
                current is SliderLoaded ||
                current is SliderLoading ||
                current is SliderError,
            builder: (context, state) {
              if (state is SliderLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is SliderLoaded) {
                return CustomCarouselSlider(articles: state.articles);
              } else {
                return const Center(
                  child: Text('Error loading slider'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
