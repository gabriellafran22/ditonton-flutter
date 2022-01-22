import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final List<Movie> movies = [];
  final GetTopRatedMovies _topRatedMovies;

  TopRatedMoviesCubit(this._topRatedMovies) : super(TopRatedMoviesEmpty());

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    final result = await _topRatedMovies.execute();

    result.fold(
          (failure) {
        emit(TopRatedMoviesError(failure.message));
      },
          (moviesData) {
        emit(TopRatedMoviesHasData(moviesData));
      },
    );
  }
}
