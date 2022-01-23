import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:core/core.dart';

class TopRatedTVSeriesPage extends StatefulWidget {
  const TopRatedTVSeriesPage({Key? key}) : super(key: key);

  @override
  _TopRatedTVSeriesPageState createState() => _TopRatedTVSeriesPageState();
}

class _TopRatedTVSeriesPageState extends State<TopRatedTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<TopRatedTvSeriesCubit>().getTopRatedTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
          builder: (context, state) {
            if (state is TopRatedTvSeriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvSeriesHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = state.result[index];
                  return TVSeriesCard(tvSeries);
                },
                itemCount: state.result.length,
              );
            } else {
              return const Text('Something Went Wrong');
            }
          },
        ),
      ),
    );
  }
}
