import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_detail_recommendations_state.dart';

class TvSeriesDetailRecommendationsCubit extends Cubit<TvSeriesDetailRecommendationsState> {
  final GetTVSeriesRecommendations _getTvSeriesRecommendations;

  TvSeriesDetailRecommendationsCubit(this._getTvSeriesRecommendations)
      : super(TvSeriesDetailRecommendationsEmpty());

  Future<void> getTvSeriesDetailRecommendations(int id) async {
    emit(TvSeriesDetailRecommendationsLoading());
    final recommendations = await _getTvSeriesRecommendations.execute(id);

    recommendations.fold(
          (failure) {
        emit(TvSeriesDetailRecommendationsError(failure.message));
      },
          (moviesData) {
        emit(TvSeriesDetailRecommendationsHasData(moviesData));
      },
    );
  }
}
