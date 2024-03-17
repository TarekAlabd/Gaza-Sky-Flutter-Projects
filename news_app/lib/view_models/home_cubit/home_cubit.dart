import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/top_headlines_request_body.dart';
import 'package:news_app/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _homeServices = HomeServices();

  Future<void> getSliderHeadlines() async {
    emit(SliderLoading());
    try {
      final articles = await _homeServices.getTopHeadlines(
        requestBody: TopHeadlinesRequestBody(
          country: 'us',
          page: 2,
          pageSize: 5,
        ),
      );
      emit(SliderLoaded(articles!));
    } catch (e) {
      emit(SliderError(e.toString()));
    }
  }
}
