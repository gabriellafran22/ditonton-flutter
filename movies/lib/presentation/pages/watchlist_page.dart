import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/tv_series.dart';

class WatchlistMoviesPage extends StatefulWidget {
  const WatchlistMoviesPage({Key? key}) : super(key: key);

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware, SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<GetWatchlistMoviesCubit>().getWatchlistMovies();
    context.read<GetWatchlistTvSeriesCubit>().getWatchlistTvSeries();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<GetWatchlistMoviesCubit>().getWatchlistMovies();
    context.read<GetWatchlistTvSeriesCubit>().getWatchlistTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Movies',
            ),
            Tab(
              text: 'TV Series',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
        child: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            MovieWatchlist(),
            TVSeriesWatchlist(),
          ],
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
    return BlocBuilder<GetWatchlistMoviesCubit, GetWatchlistMoviesState>(
      builder: (context, state) {
        if (state is GetWatchlistMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetWatchlistMoviesHasData) {
          if (state.result.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.result[index];
                return MovieCard(movie);
              },
              itemCount: state.result.length,
            );
          }
          return const Center(
            child: Text('Movies Watchlist is Empty'),
          );
        } else {
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}

class TVSeriesWatchlist extends StatelessWidget {
  const TVSeriesWatchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWatchlistTvSeriesCubit, GetWatchlistTvSeriesState>(
      builder: (context, state) {
        if (state is GetWatchlistTvSeriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetWatchlistTvSeriesHasData) {
          if (state.result.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tvSeries = state.result[index];
                return TVSeriesCard(tvSeries);
              },
              itemCount: state.result.length,
            );
          }
          return const Center(
            child: Text('TV Series Watchlist is Empty'),
          );
        } else {
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}
