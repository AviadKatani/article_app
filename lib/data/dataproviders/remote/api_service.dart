import 'package:articles_app/data/dataproviders/remote/api_config.dart';
import 'package:articles_app/data/models/response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("everything")
  Future<BaseResponse> getSearchResults(
    @Query("apiKey") String apiKey,
    @Query("q") String searchQuery,
  );
}
