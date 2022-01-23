import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'movie_watchlist_state.dart';

class MovieWatchlistCubit extends Cubit<MovieWatchlistState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

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

// void increment() {
//   emit(CounterState(state.value + 1));
// }
//
// void decrement() {
//   emit(CounterState(state.value - 1));
// }
}
