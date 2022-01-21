import 'package:core/presentation/widgets/tv_series_card.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/bloc/search_tv_series/search_tv_series_bloc.dart';
import 'package:search/presentation/provider/tv_series_search_notifier.dart';

class TVSeriesSearchPage extends StatelessWidget {
  const TVSeriesSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              // onSubmitted: (query) {
              //   Provider.of<TVSeriesSearchNotifier>(context, listen: false)
              //       .fetchTVSeriesSearch(query);
              // },
              onChanged: (query) {
                context.read<SearchTvSeriesBloc>().add(OnQueryChangedTVSeries(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search TV Series Title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<SearchTvSeriesBloc, SearchTVSeriesState>(
              builder: (context, state) {
                if (state is SearchTVSeriesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchTVSeriesHasData) {
                  final result = state.result;
                  if (result.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'TV Series Not Found',
                          style: kHeading5,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final tvSeries = state.result[index];
                        return TVSeriesCard(tvSeries);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else if (state is SearchTVSeriesError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
            // Consumer<TVSeriesSearchNotifier>(
            //   builder: (context, data, child) {
            //     if (data.state == RequestState.Loading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (data.state == RequestState.Loaded) {
            //       final result = data.searchResult;
            //       if (result.isEmpty) {
            //         return Center(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 20),
            //             child: Text(
            //               'TV Series Not Found',
            //               style: kHeading5,
            //             ),
            //           ),
            //         );
            //       }
            //       return Expanded(
            //         child: ListView.builder(
            //           padding: const EdgeInsets.all(8),
            //           itemBuilder: (context, index) {
            //             final tvSeries = data.searchResult[index];
            //             return TVSeriesCard(tvSeries);
            //           },
            //           itemCount: result.length,
            //         ),
            //       );
            //     } else {
            //       return Expanded(
            //         child: Container(),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
