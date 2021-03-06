import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:movies/movies.dart';
import 'package:equatable/equatable.dart';

part 'movie_watchlist_state.dart';

class MovieWatchlistCubit extends Cubit<MovieWatchlistState> {
  String message = '';

  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieWatchlistCubit(
      this.getWatchListStatus, this.saveWatchlist, this.removeWatchlist)
      : super(MovieWatchlistState(false));

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    result
        ? message = watchlistAddSuccessMessage
        : message = watchlistRemoveSuccessMessage;
    emit(MovieWatchlistState(result));
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        emit(MovieWatchlistState(false));
        message = failure.message;
      },
      (successMessage) async {
        emit(MovieWatchlistState(true));
        message = successMessage;
      },
    );

    await loadWatchlistStatus(movie.id);
  }

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        emit(MovieWatchlistState(true));
        message = failure.message;
      },
      (successMessage) async {
        emit(MovieWatchlistState(false));
        message = successMessage;
      },
    );

    await loadWatchlistStatus(movie.id);
  }

}
