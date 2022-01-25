import 'package:bloc/bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_tv_series_state.dart';

class NowPlayingTvSeriesCubit extends Cubit<NowPlayingTvSeriesState> {
  final GetNowPlayingTVSeries _nowPlayingTvSeries;

  NowPlayingTvSeriesCubit(this._nowPlayingTvSeries) : super(NowPlayingTvSeriesEmpty());

  Future<void> getNowPlayingTvSeries() async {
    emit(NowPlayingTvSeriesLoading());
    final result = await _nowPlayingTvSeries.execute();

    result.fold(
          (failure) {
        emit(NowPlayingTvSeriesError(failure.message));
      },
          (moviesData) {
        emit(NowPlayingTvSeriesHasData(moviesData));
      },
    );
  }
}
