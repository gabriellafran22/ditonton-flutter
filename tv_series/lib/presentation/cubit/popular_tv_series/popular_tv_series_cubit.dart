import 'package:bloc/bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:equatable/equatable.dart';

part 'popular_tv_series_state.dart';

class PopularTvSeriesCubit extends Cubit<PopularTvSeriesState> {
  final GetPopularTVSeries _popularTvSeries;

  PopularTvSeriesCubit(this._popularTvSeries) : super(PopularTvSeriesEmpty());

  Future<void> getPopularTvSeries() async {
    emit(PopularTvSeriesLoading());
    final result = await _popularTvSeries.execute();

    result.fold(
          (failure) {
        emit(PopularTvSeriesError(failure.message));
      },
          (moviesData) {
        emit(PopularTvSeriesHasData(moviesData));
      },
    );
  }
}
