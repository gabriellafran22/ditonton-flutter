import 'package:core/core.dart';
import 'package:core/presentation/cubit/get_watchlist_movies/get_watchlist_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/tv_series.dart';

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
    context.read<GetWatchlistMoviesCubit>().getWatchlistMovies();
    context.read<GetWatchlistTvSeriesCubit>().getWatchlistTvSeries();
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
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
    return BlocBuilder<GetWatchlistMoviesCubit, GetWatchlistMoviesState>(
      builder: (context, state) {
        if (state is GetWatchlistMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetWatchlistMoviesHasData) {
          if (state.result.isNotEmpty) {
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
                    final movie = state.result[index];
                    return MovieCard(movie);
                  },
                  itemCount: state.result.length,
                ),
              ],
            );
          }
          return Container();
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
                    final tvSeries = state.result[index];
                    return TVSeriesCard(tvSeries);
                  },
                  itemCount: state.result.length,
                ),
              ],
            );
          }
          return Container();
        } else {
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}
