part of 'get_watchlist_tv_series_cubit.dart';

class GetWatchlistTvSeriesState extends Equatable {
  const GetWatchlistTvSeriesState();

  @override
  List<Object> get props => [];
}

class GetWatchlistTvSeriesEmpty extends GetWatchlistTvSeriesState {}

class GetWatchlistTvSeriesLoading extends GetWatchlistTvSeriesState {}

class GetWatchlistTvSeriesError extends GetWatchlistTvSeriesState {
  final String message;

  const GetWatchlistTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetWatchlistTvSeriesHasData extends GetWatchlistTvSeriesState {
  final List<TVSeries> result;

  const GetWatchlistTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}
