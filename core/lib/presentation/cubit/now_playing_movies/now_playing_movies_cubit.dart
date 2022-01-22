import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  final List<Movie> movies = [];
  final GetNowPlayingMovies _topRatedMovies;

  NowPlayingMoviesCubit(this._topRatedMovies) : super(NowPlayingMoviesEmpty());

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    final result = await _topRatedMovies.execute();

    result.fold(
          (failure) {
        emit(NowPlayingMoviesError(failure.message));
      },
          (moviesData) {
        emit(NowPlayingMoviesHasData(moviesData));
      },
    );
  }
}
