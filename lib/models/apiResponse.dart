import 'package:json_annotation/json_annotation.dart';


part 'apiResponse.g.dart';


@JsonSerializable()

class ApiResponse extends Object with _$ApiResponseSerializerMixin {
  ApiResponse(this.page, this.totalResults, this.totalPages, this.results);

  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  dynamic results;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
}