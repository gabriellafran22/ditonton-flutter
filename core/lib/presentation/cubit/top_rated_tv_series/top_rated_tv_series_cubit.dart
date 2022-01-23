import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/get_top_rated_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_tv_series_state.dart';

class TopRatedTvSeriesCubit extends Cubit<TopRatedTvSeriesState> {
  final GetTopRatedTVSeries _topRatedTvSeries;

  TopRatedTvSeriesCubit(this._topRatedTvSeries) : super(TopRatedTvSeriesEmpty());

  Future<void> getTopRatedTvSeries() async {
    emit(TopRatedTvSeriesLoading());
    final result = await _topRatedTvSeries.execute();

    result.fold(
          (failure) {
        emit(TopRatedTvSeriesError(failure.message));
      },
          (moviesData) {
        emit(TopRatedTvSeriesHasData(moviesData));
      },
    );
  }
}
