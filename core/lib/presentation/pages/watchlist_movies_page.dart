import 'package:core/presentation/provider/watchlist_movie_notifier.dart';
import 'package:core/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:core/presentation/widgets/tv_series_card.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/state_enum.dart';
import 'package:core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistMoviesPage extends StatefulWidget {
  const WatchlistMoviesPage({Key? key}) : super(key: key);


  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistMovieNotifier>(context, listen: false)
            .fetchWatchlistMovies());
    Future.microtask(() =>
        Provider.of<WatchlistTVSeriesNotifier>(context, listen: false)
            .fetchWatchlistTVSeries());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Provider.of<WatchlistMovieNotifier>(context, listen: false)
        .fetchWatchlistMovies();
    Provider.of<WatchlistTVSeriesNotifier>(context, listen: false)
        .fetchWatchlistTVSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Provider.of<WatchlistMovieNotifier>(context, listen: false)
                          .watchlistMovies.isEmpty &&
                  Provider.of<WatchlistTVSeriesNotifier>(context, listen: false)
                          .watchlistTVSeries.isEmpty
              ? Center(
                  child: Text(
                    'No Watchlist Added Yet',
                    style: kHeading5,
                  ),
                )
              : Column(
                  children: const [
                    MovieWatchlist(),
                    SizedBox(
                      height: 20,
                    ),
                    TVSeriesWatchlist(),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

class MovieWatchlist extends StatelessWidget {
  const MovieWatchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WatchlistMovieNotifier>(
      builder: (context, data, child) {
        if (data.watchlistState == RequestState.Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.watchlistState == RequestState.Loaded) {
          if (data.watchlistMovies.isNotEmpty) {
            return Column(
              children: [
                Text(
                  'Movies',
                  style: kHeading5,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = data.watchlistMovies[index];
                    return MovieCard(movie);
                  },
                  itemCount: data.watchlistMovies.length,
                ),
              ],
            );
          }
          return Container();
        } else {
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
          );
        }
      },
    );
  }
}

class TVSeriesWatchlist extends StatelessWidget {
  const TVSeriesWatchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WatchlistTVSeriesNotifier>(
      builder: (context, data, child) {
        if (data.watchlistState == RequestState.Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.watchlistState == RequestState.Loaded) {
          if (data.watchlistTVSeries.isNotEmpty) {
            return Column(
              children: [
                Text(
                  'TV Series',
                  style: kHeading5,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final tvSeries = data.watchlistTVSeries[index];
                    return TVSeriesCard(tvSeries);
                  },
                  itemCount: data.watchlistTVSeries.length,
                ),
              ],
            );
          }
          return Container();
        } else {
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
          );
        }
      },
    );
  }
}
