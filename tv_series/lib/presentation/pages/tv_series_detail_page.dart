import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/tv_series.dart';

class TVSeriesDetailPage extends StatefulWidget {
  final int id;

  const TVSeriesDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _TVSeriesDetailPageState createState() => _TVSeriesDetailPageState();
}

class _TVSeriesDetailPageState extends State<TVSeriesDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<TvSeriesDetailCubit>().getTvSeriesDetail(widget.id);
    context.read<TvSeriesWatchlistCubit>().loadWatchlistStatus(widget.id);
    context
        .read<TvSeriesDetailRecommendationsCubit>()
        .getTvSeriesDetailRecommendations(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvSeriesDetailCubit, TvSeriesDetailState>(
        builder: (context, state) {
          if (state is TvSeriesDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvSeriesDetailHasData) {
            final tvSeries = state.result;
            return SafeArea(
              child: DetailContentTVSeries(
                tvSeries,
              ),
            );
          } else if (state is TvSeriesDetailError) {
            return Text(state.message);
          } else {
            return const Text('Something Went Wrong');
          }
        },
      ),
    );
  }
}

class DetailContentTVSeries extends StatelessWidget {
  final TVSeriesDetail tvSeries;

  const DetailContentTVSeries(this.tvSeries, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvSeries.name,
                              style: kHeading5,
                            ),
                            BlocBuilder<TvSeriesWatchlistCubit,
                                TvSeriesWatchlistState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (!state.isAddedToWatchlist) {
                                      await context
                                          .read<TvSeriesWatchlistCubit>()
                                          .addWatchlist(tvSeries);
                                    } else {
                                      await context
                                          .read<TvSeriesWatchlistCubit>()
                                          .removeFromWatchlist(tvSeries);
                                    }

                                    final message = context
                                        .read<TvSeriesWatchlistCubit>()
                                        .message;

                                    if (message == watchlistAddSuccessMessage ||
                                        message ==
                                            watchlistRemoveSuccessMessage) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(message),
                                          duration:
                                              const Duration(milliseconds: 500),
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(message),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      state.isAddedToWatchlist
                                          ? const Icon(Icons.check)
                                          : const Icon(Icons.add),
                                      const Text('Watchlist'),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Text(
                              _showGenres(tvSeries.genres),
                            ),
                            _information(
                              'Episode Runtime: ',
                              _showRuntime(tvSeries.episodeRunTime),
                            ),
                            _information(
                              'Total Seasons: ',
                              tvSeries.numberOfSeasons.toString(),
                            ),
                            _information(
                              'Total Episodes: ',
                              tvSeries.numberOfEpisodes.toString(),
                            ),
                            _information(
                              'First Episode Airing Date: ',
                              tvSeries.firstAirDate.toString(),
                            ),
                            _information(
                              'TV Series Status: ',
                              tvSeries.status.toString(),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tvSeries.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tvSeries.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvSeries.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            const TvSeriesDetailRecommendations(),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showRuntime(List runtime) {
    int length = runtime.length;
    String episodeRuntime;
    if (length == 0) {
      return '-';
    } else if (length < 2) {
      episodeRuntime = '${runtime[0].toString()} Minutes';
      return episodeRuntime;
    }

    runtime.sort();
    episodeRuntime =
        '${runtime[0].toString()} - ${runtime[length - 1].toString()} Minutes';

    return episodeRuntime;
  }

  Widget _information(String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          content,
        ),
      ],
    );
  }
}

class TvSeriesDetailRecommendations extends StatelessWidget {
  const TvSeriesDetailRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesDetailRecommendationsCubit,
        TvSeriesDetailRecommendationsState>(
      builder: (context, state) {
        if (state is TvSeriesDetailRecommendationsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TvSeriesDetailRecommendationsHasData) {
          final recommendations = state.recommendations;
          return SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final tvSeries = recommendations[index];
                return  Card(
                  color: kRichBlack,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          tvSeriesDetailRoute,
                          arguments: tvSeries.id,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                          'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: recommendations.length,
            ),
          );
        } else if (state is TvSeriesDetailRecommendationsError) {
          return Text(state.message);
        } else {
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}
