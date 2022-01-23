import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/get_watchlist_movies.dart';
import 'package:equatable/equatable.dart';

part 'get_watchlist_movies_state.dart';

class GetWatchlistMoviesCubit extends Cubit<GetWatchlistMoviesState> {
  final GetWatchlistMovies _getWatchlistMovies;

  GetWatchlistMoviesCubit(this._getWatchlistMovies) : super(GetWatchlistMoviesEmpty());

  Future<void> getWatchlistMovies() async {
    emit(GetWatchlistMoviesLoading());
    final result = await _getWatchlistMovies.execute();

    result.fold(
          (failure) {
        emit(GetWatchlistMoviesError(failure.message));
      },
          (moviesData) {
        emit(GetWatchlistMoviesHasData(moviesData));
      },
    );
  }
}
