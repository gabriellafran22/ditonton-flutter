import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/tv_series.dart';
part 'tv_series_watchlist_state.dart';

class TvSeriesWatchlistCubit extends Cubit<TvSeriesWatchlistState> {
  String message = '';

  final GetWatchListStatusTVSeries getWatchListStatus;
  final SaveWatchlistTVSeries saveWatchlist;
  final RemoveWatchlistTVSeries removeWatchlist;

  TvSeriesWatchlistCubit(
      this.getWatchListStatus, this.saveWatchlist, this.removeWatchlist)
      : super(TvSeriesWatchlistState(false));

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    result
        ? message = watchlistAddSuccessMessage
        : message = watchlistRemoveSuccessMessage;
    emit(TvSeriesWatchlistState(result));
  }

  Future<void> addWatchlist(TVSeriesDetail tvSeries) async {
    final result = await saveWatchlist.execute(tvSeries);

    await result.fold(
          (failure) async {
        emit(TvSeriesWatchlistState(false));
        message = failure.message;
      },
          (successMessage) async {
        emit(TvSeriesWatchlistState(true));
        message = successMessage;
      },
    );

    await loadWatchlistStatus(tvSeries.id);
  }

  Future<void> removeFromWatchlist(TVSeriesDetail tvSeries) async {
    final result = await removeWatchlist.execute(tvSeries);

    await result.fold(
          (failure) async {
        emit(TvSeriesWatchlistState(true));
        message = failure.message;
      },
          (successMessage) async {
        emit(TvSeriesWatchlistState(false));
        message = successMessage;
      },
    );

    await loadWatchlistStatus(tvSeries.id);
  }
}
