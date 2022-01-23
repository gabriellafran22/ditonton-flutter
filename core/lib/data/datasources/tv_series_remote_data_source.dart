import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

abstract class TVSeriesRemoteDataSource {
  Future<List<TVSeriesModel>> getNowPlayingTVSeries();

  Future<List<TVSeriesModel>> getPopularTVSeries();

  Future<List<TVSeriesModel>> getTopRatedTVSeries();

  Future<TVSeriesDetailResponse> getTVSeriesDetail(int id);

  Future<List<TVSeriesModel>> getTVSeriesRecommendations(int id);

  Future<List<TVSeriesModel>> searchTVSeries(String query);
}

class TVSeriesRemoteDataSourceImpl implements TVSeriesRemoteDataSource {
  final http.Client client;

  TVSeriesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TVSeriesModel>> getNowPlayingTVSeries() async {
    HttpClient client = HttpClient(context: await globalContext);
    IOClient ioClient = IOClient(client);
    final response =
        await ioClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TVSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> getPopularTVSeries() async {
    HttpClient client = HttpClient(context: await globalContext);
    IOClient ioClient = IOClient(client);
    final response =
        await ioClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TVSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> getTopRatedTVSeries() async {
    HttpClient client = HttpClient(context: await globalContext);
    IOClient ioClient = IOClient(client);
    final response =
        await ioClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TVSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TVSeriesDetailResponse> getTVSeriesDetail(int id) async {
    HttpClient client = HttpClient(context: await globalContext);
    IOClient ioClient = IOClient(client);
    final response = await ioClient.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TVSeriesDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> getTVSeriesRecommendations(int id) async {
    HttpClient client = HttpClient(context: await globalContext);
    IOClient ioClient = IOClient(client);
    final response = await ioClient
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TVSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVSeriesModel>> searchTVSeries(String query) async {
    HttpClient client = HttpClient(context: await globalContext);
    IOClient ioClient = IOClient(client);
    final response = await ioClient
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return TVSeriesResponse.fromJson(json.decode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }
}
