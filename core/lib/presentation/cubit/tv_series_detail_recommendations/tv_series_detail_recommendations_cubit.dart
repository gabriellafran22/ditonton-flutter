import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/get_tv_series_recommendations.dart';
import 'package:equatable/equatable.dart';

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
