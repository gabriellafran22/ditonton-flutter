import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series_detail.dart';
import 'package:core/domain/usecases/get_tv_series_detail.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_detail_state.dart';

class TvSeriesDetailCubit extends Cubit<TvSeriesDetailState> {
  final GetTVSeriesDetail _getTvSeriesDetail;

  TvSeriesDetailCubit(this._getTvSeriesDetail)
      : super(TvSeriesDetailEmpty());

  Future<void> getTvSeriesDetail(int id) async {
    emit(TvSeriesDetailLoading());
    final result = await _getTvSeriesDetail.execute(id);

    result.fold(
          (failure) {
        emit(TvSeriesDetailError(failure.message));
      },
          (tvSeriesData) async {
        emit(TvSeriesDetailHasData(tvSeriesData));
      },
    );
  }
}
