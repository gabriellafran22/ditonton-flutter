part of 'tv_series_watchlist_cubit.dart';

class TvSeriesWatchlistState extends Equatable {
  bool isAddedToWatchlist = false;

  TvSeriesWatchlistState(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

