part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SliderLoading extends HomeState {}

final class SliderLoaded extends HomeState {
  final List<Article> articles;

  SliderLoaded(this.articles);
}

final class SliderError extends HomeState {
  final String message;

  SliderError(this.message);
}

final class NewsLoading extends HomeState {}

final class NewsLoaded extends HomeState {
  final List<Article> articles;

  NewsLoaded(this.articles);
}

final class NewsError extends HomeState {
  final String message;

  NewsError(this.message);
}
