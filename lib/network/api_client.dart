import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'api_client.g.dart';

@RestApi(baseUrl: 'https://wallpaper71.coder71.com/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("collections")
  Future<dynamic> getCollectionCategory();

  @GET("products/recent")
  Future<dynamic> getProductRecent();


}
