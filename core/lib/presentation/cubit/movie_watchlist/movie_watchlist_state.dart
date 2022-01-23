part of 'movie_watchlist_cubit.dart';

class MovieWatchlistState extends Equatable {
  bool isAddedToWatchlist = false;

  MovieWatchlistState(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}
