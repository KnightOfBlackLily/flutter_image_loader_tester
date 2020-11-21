import 'package:dio/dio.dart';
import 'package:fast_image/model/wallhaven_image.dart';
import 'package:quiver/iterables.dart';

class ImagesApi {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://wallhaven.cc/api/v1/',
      validateStatus: (status) => true))
    ..interceptors.add(LogInterceptor());

  bool _isLoading = false;
  int _page = 0;

  List<WallhavenImage> items = [];

  List<List<WallhavenImage>> preparedItems = [];

  final VoidCallback callback;

  final int seed;

  ImagesApi(this.seed, this.callback);

  Future<void> loadNextPage() async {
    if (_isLoading) return;

    _isLoading = true;

    var response = await dio.get('search', queryParameters: {
      if (_page > 0) 'page': _page,
      'seed': seed,
      'sorting': 'random',
      'apikey': '<API KEY>',
    });

    print(response);

    var newItems = (response.data['data'] as List)
        .map((e) => WallhavenImage.fromMap(e))
        .toList();
    items.addAll(newItems);
    preparedItems = partition(items, 4).toList();

    callback();
    _isLoading = false;
  }
}
