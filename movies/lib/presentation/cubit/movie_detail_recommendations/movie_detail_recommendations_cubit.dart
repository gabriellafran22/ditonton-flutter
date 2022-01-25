import 'package:bloc/bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_recommendations_state.dart';

class MovieDetailRecommendationsCubit
    extends Cubit<MovieDetailRecommendationsState> {
  final GetMovieRecommendations _getMovieRecommendations;

  MovieDetailRecommendationsCubit(this._getMovieRecommendations)
      : super(MovieDetailRecommendationsEmpty());

  Future<void> getMovieDetailRecommendations(int id) async {
    emit(MovieDetailRecommendationsLoading());
    final recommendations = await _getMovieRecommendations.execute(id);

    recommendations.fold(
      (failure) {
        emit(MovieDetailRecommendationsError(failure.message));
      },
      (moviesData) {
        emit(MovieDetailRecommendationsHasData(moviesData));
      },
    );
  }
}
