import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/presentation/cubit/movie_detail_recommendations/movie_detail_recommendations_cubit.dart';
import 'package:core/presentation/cubit/movie_watchlist/movie_watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;

  const MovieDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // Provider.of<MovieDetailNotifier>(context, listen: false)
      //     .fetchMovieDetail(widget.id);
      Provider.of<MovieDetailNotifier>(context, listen: false)
          .loadWatchlistStatus(widget.id);
    });
    context.read<MovieDetailCubit>().getMovieDetail(widget.id);
    context.read<MovieWatchlistCubit>().loadWatchlistStatus(widget.id);
    context
        .read<MovieDetailRecommendationsCubit>()
        .getMovieDetailRecommendations(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieDetailHasData) {
            final movie = state.result;
            return SafeArea(
              child: DetailContent(
                movie,
                // ,
                // provider.isAddedToWatchlist,
              ),
            );
          } else if (state is MovieDetailError) {
            return Text(state.message);
          } else {
            return Text('Something Went Wrong');
          }
        },
      ),
      // body: Consumer<MovieDetailNotifier>(
      //   builder: (context, provider, child) {
      //     if (provider.movieState == RequestState.Loading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (provider.movieState == RequestState.Loaded) {
      //       final movie = provider.movie;
      //       return SafeArea(
      //         child: DetailContent(
      //           movie,
      //           provider.movieRecommendations,
      //           provider.isAddedToWatchlist,
      //         ),
      //       );
      //     } else {
      //       return Text(provider.message);
      //     }
      //   },
      // ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;

  // final List<Movie> recommendations;
  // final bool isAddedWatchlist;

  // const DetailContent(this.movie, this.recommendations, this.isAddedWatchlist,
  //     {Key? key})
  //     : super(key: key);
  const DetailContent(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
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
                              movie.title,
                              style: kHeading5,
                            ),
                            BlocBuilder<MovieWatchlistCubit,
                                MovieWatchlistState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (!state.isAddedToWatchlist) {
                                      await context
                                          .read<MovieWatchlistCubit>()
                                          .addWatchlist(movie);
                                    } else {
                                      await context
                                          .read<MovieWatchlistCubit>()
                                          .removeFromWatchlist(movie);
                                    }

                                    final message = context
                                        .read<MovieWatchlistCubit>()
                                        .message;

                                    if (message ==
                                            MovieWatchlistCubit
                                                .watchlistAddSuccessMessage ||
                                        message ==
                                            MovieWatchlistCubit
                                                .watchlistRemoveSuccessMessage) {
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
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     if (!isAddedWatchlist) {
                            //       await Provider.of<MovieDetailNotifier>(
                            //           context,
                            //           listen: false)
                            //           .addWatchlist(movie);
                            //     } else {
                            //       await Provider.of<MovieDetailNotifier>(
                            //           context,
                            //           listen: false)
                            //           .removeFromWatchlist(movie);
                            //     }
                            //
                            //     final message =
                            //         Provider.of<MovieDetailNotifier>(context,
                            //             listen: false)
                            //             .watchlistMessage;
                            //
                            //     if (message ==
                            //         MovieDetailNotifier
                            //             .watchlistAddSuccessMessage ||
                            //         message ==
                            //             MovieDetailNotifier
                            //                 .watchlistRemoveSuccessMessage) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(content: Text(message)));
                            //     } else {
                            //       showDialog(
                            //           context: context,
                            //           builder: (context) {
                            //             return AlertDialog(
                            //               content: Text(message),
                            //             );
                            //           });
                            //     }
                            //   },
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       isAddedWatchlist
                            //           ? const Icon(Icons.check)
                            //           : const Icon(Icons.add),
                            //       const Text('Watchlist'),
                            //     ],
                            //   ),
                            // ),
                            Text(
                              _showGenres(movie.genres),
                            ),
                            Text(
                              _showDuration(movie.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movie.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<MovieDetailRecommendationsCubit,
                                MovieDetailRecommendationsState>(
                              builder: (context, state) {
                                if (state
                                    is MovieDetailRecommendationsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state
                                    is MovieDetailRecommendationsHasData) {
                                  final recommendations = state.recommendations;
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final movie = recommendations[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                movieDetailRoute,
                                                arguments: movie.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
                                    ),
                                  );
                                } else if (state
                                    is MovieDetailRecommendationsError) {
                                  return Text(state.message);
                                } else {
                                  return Text('Something Went Wrong');
                                }
                              },
                            ),
                            // Consumer<MovieDetailNotifier>(
                            //   builder: (context, data, child) {
                            //     if (data.recommendationState ==
                            //         RequestState.Loading) {
                            //       return const Center(
                            //         child: CircularProgressIndicator(),
                            //       );
                            //     } else if (data.recommendationState ==
                            //         RequestState.Error) {
                            //       return Text(data.message);
                            //     } else if (data.recommendationState ==
                            //         RequestState.Loaded) {
                            //       return SizedBox(
                            //         height: 150,
                            //         child: ListView.builder(
                            //           scrollDirection: Axis.horizontal,
                            //           itemBuilder: (context, index) {
                            //             final movie = recommendations[index];
                            //             return Padding(
                            //               padding: const EdgeInsets.all(4.0),
                            //               child: InkWell(
                            //                 onTap: () {
                            //                   Navigator.pushReplacementNamed(
                            //                     context,
                            //                     movieDetailRoute,
                            //                     arguments: movie.id,
                            //                   );
                            //                 },
                            //                 child: ClipRRect(
                            //                   borderRadius:
                            //                   const BorderRadius.all(
                            //                     Radius.circular(8),
                            //                   ),
                            //                   child: CachedNetworkImage(
                            //                     imageUrl:
                            //                     'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            //                     placeholder: (context, url) =>
                            //                     const Center(
                            //                       child:
                            //                       CircularProgressIndicator(),
                            //                     ),
                            //                     errorWidget:
                            //                         (context, url, error) =>
                            //                     const Icon(Icons.error),
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           },
                            //           itemCount: recommendations.length,
                            //         ),
                            //       );
                            //     } else {
                            //       return Container();
                            //     }
                            //   },
                            // ),
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

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

// class DetailContent extends StatelessWidget {
//   final MovieDetail movie;
//   final List<Movie> recommendations;
//   final bool isAddedWatchlist;
//
//   const DetailContent(this.movie, this.recommendations, this.isAddedWatchlist,
//       {Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Stack(
//       children: [
//         CachedNetworkImage(
//           imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//           width: screenWidth,
//           placeholder: (context, url) => const Center(
//             child: CircularProgressIndicator(),
//           ),
//           errorWidget: (context, url, error) => const Icon(Icons.error),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 48 + 8),
//           child: DraggableScrollableSheet(
//             builder: (context, scrollController) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: kRichBlack,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//                 ),
//                 padding: const EdgeInsets.only(
//                   left: 16,
//                   top: 16,
//                   right: 16,
//                 ),
//                 child: Stack(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 16),
//                       child: SingleChildScrollView(
//                         controller: scrollController,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               movie.title,
//                               style: kHeading5,
//                             ),
//                             ElevatedButton(
//                               onPressed: () async {
//                                 if (!isAddedWatchlist) {
//                                   await Provider.of<MovieDetailNotifier>(
//                                           context,
//                                           listen: false)
//                                       .addWatchlist(movie);
//                                 } else {
//                                   await Provider.of<MovieDetailNotifier>(
//                                           context,
//                                           listen: false)
//                                       .removeFromWatchlist(movie);
//                                 }
//
//                                 final message =
//                                     Provider.of<MovieDetailNotifier>(context,
//                                             listen: false)
//                                         .watchlistMessage;
//
//                                 if (message ==
//                                         MovieDetailNotifier
//                                             .watchlistAddSuccessMessage ||
//                                     message ==
//                                         MovieDetailNotifier
//                                             .watchlistRemoveSuccessMessage) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text(message)));
//                                 } else {
//                                   showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return AlertDialog(
//                                           content: Text(message),
//                                         );
//                                       });
//                                 }
//                               },
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   isAddedWatchlist
//                                       ? const Icon(Icons.check)
//                                       : const Icon(Icons.add),
//                                   const Text('Watchlist'),
//                                 ],
//                               ),
//                             ),
//                             Text(
//                               _showGenres(movie.genres),
//                             ),
//                             Text(
//                               _showDuration(movie.runtime),
//                             ),
//                             Row(
//                               children: [
//                                 RatingBarIndicator(
//                                   rating: movie.voteAverage / 2,
//                                   itemCount: 5,
//                                   itemBuilder: (context, index) => const Icon(
//                                     Icons.star,
//                                     color: kMikadoYellow,
//                                   ),
//                                   itemSize: 24,
//                                 ),
//                                 Text('${movie.voteAverage}')
//                               ],
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               'Overview',
//                               style: kHeading6,
//                             ),
//                             Text(
//                               movie.overview,
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               'Recommendations',
//                               style: kHeading6,
//                             ),
//                             Consumer<MovieDetailNotifier>(
//                               builder: (context, data, child) {
//                                 if (data.recommendationState ==
//                                     RequestState.Loading) {
//                                   return const Center(
//                                     child: CircularProgressIndicator(),
//                                   );
//                                 } else if (data.recommendationState ==
//                                     RequestState.Error) {
//                                   return Text(data.message);
//                                 } else if (data.recommendationState ==
//                                     RequestState.Loaded) {
//                                   return SizedBox(
//                                     height: 150,
//                                     child: ListView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       itemBuilder: (context, index) {
//                                         final movie = recommendations[index];
//                                         return Padding(
//                                           padding: const EdgeInsets.all(4.0),
//                                           child: InkWell(
//                                             onTap: () {
//                                               Navigator.pushReplacementNamed(
//                                                 context,
//                                                 movieDetailRoute,
//                                                 arguments: movie.id,
//                                               );
//                                             },
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                 Radius.circular(8),
//                                               ),
//                                               child: CachedNetworkImage(
//                                                 imageUrl:
//                                                     'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//                                                 placeholder: (context, url) =>
//                                                     const Center(
//                                                   child:
//                                                       CircularProgressIndicator(),
//                                                 ),
//                                                 errorWidget:
//                                                     (context, url, error) =>
//                                                         const Icon(Icons.error),
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       itemCount: recommendations.length,
//                                     ),
//                                   );
//                                 } else {
//                                   return Container();
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Container(
//                         color: Colors.white,
//                         height: 4,
//                         width: 48,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             // initialChildSize: 0.5,
//             minChildSize: 0.25,
//             // maxChildSize: 1.0,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundColor: kRichBlack,
//             foregroundColor: Colors.white,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   String _showGenres(List<Genre> genres) {
//     String result = '';
//     for (var genre in genres) {
//       result += genre.name + ', ';
//     }
//
//     if (result.isEmpty) {
//       return result;
//     }
//
//     return result.substring(0, result.length - 2);
//   }
//
//   String _showDuration(int runtime) {
//     final int hours = runtime ~/ 60;
//     final int minutes = runtime % 60;
//
//     if (hours > 0) {
//       return '${hours}h ${minutes}m';
//     } else {
//       return '${minutes}m';
//     }
//   }
// }
