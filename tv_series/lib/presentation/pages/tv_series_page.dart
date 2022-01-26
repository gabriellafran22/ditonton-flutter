import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/tv_series.dart';

class TVSeriesPage extends StatefulWidget {
  const TVSeriesPage({Key? key}) : super(key: key);

  @override
  _TVSeriesPageState createState() => _TVSeriesPageState();
}

class _TVSeriesPageState extends State<TVSeriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingTvSeriesCubit>().getNowPlayingTvSeries();
    context.read<PopularTvSeriesCubit>().getPopularTvSeries();
    context.read<TopRatedTvSeriesCubit>().getTopRatedTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.jpg'),
              ),
              accountName: Text('Gabriella Franchesca'),
              accountEmail: Text('gabriellafranchesca22@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, homeMoviesRoute);
              },
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('TV Series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, watchlistRoute);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, aboutRoute);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton TV Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchTVSeriesRoute);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              const NowPlayingTvSeriesWidget(),
              _buildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(context, popularTVSeriesRoute),
              ),
              const PopularTvSeriesWidget(),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, topRatedTVSeriesRoute),
              ),
              const TopRatedTvSeriesWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class NowPlayingTvSeriesWidget extends StatelessWidget {
  const NowPlayingTvSeriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingTvSeriesCubit, NowPlayingTvSeriesState>(
      builder: (context, state) {
        if (state is NowPlayingTvSeriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NowPlayingTvSeriesHasData) {
          return TVSeriesList(state.result);
        } else {
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}

class PopularTvSeriesWidget extends StatelessWidget {
  const PopularTvSeriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTvSeriesCubit, PopularTvSeriesState>(
      builder: (context, state) {
        if (state is PopularTvSeriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularTvSeriesHasData) {
          return TVSeriesList(state.result);
        } else {
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}

class TopRatedTvSeriesWidget extends StatelessWidget {
  const TopRatedTvSeriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
      builder: (context, state) {
        if (state is TopRatedTvSeriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopRatedTvSeriesHasData) {
          return TVSeriesList(state.result);
        } else {
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}

class TVSeriesList extends StatelessWidget {
  final List<TVSeries> tvSeries;

  const TVSeriesList(this.tvSeries, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = tvSeries[index];
          return Card(
            color: kRichBlack,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    tvSeriesDetailRoute,
                    arguments: tvSeries[index].id,
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
