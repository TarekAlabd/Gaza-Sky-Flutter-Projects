part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<Article> articles;

  SearchLoaded(this.articles);
}

final class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
