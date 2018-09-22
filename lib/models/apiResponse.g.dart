// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return new ApiResponse(json['page'] as int, json['total_results'] as int,
      json['total_pages'] as int, json['results']);
}

abstract class _$ApiResponseSerializerMixin {
  int get page;
  int get totalResults;
  int get totalPages;
  dynamic get results;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'total_results': totalResults,
        'total_pages': totalPages,
        'results': results
      };
}
