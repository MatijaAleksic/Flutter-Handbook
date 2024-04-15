import 'package:flutter_mini_project/core/utils/helpers/json_helper.dart';
import 'package:flutter_mini_project/features/university/data/dto/university_dto.dart';
import 'package:flutter_mini_project/features/university/domain/constants/university_api_constants.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/university_mapper.dart';
import 'package:http/http.dart' as http;

class UniversityProvider {
  final JsonHelper _jsonHelper;
  final UniversityMapper _universityMapper;

  UniversityProvider(
      {required JsonHelper jsonHelper,
      required UniversityMapper universityMapper})
      : _jsonHelper = jsonHelper,
        _universityMapper = universityMapper;

  Future<List<UniversityDto>> getUniversities(String country) async {
    final response = await http
        .get(Uri.parse(UniversityApiConstants.universitiesUrl + country));
    final requestSuccessful = response.statusCode;

    if (requestSuccessful == 200) {
      return _universityMapper
          .fromJsonToUniversityDto(_jsonHelper.decodeJson(response.body));
    } else {
      throw Exception('Universities not loaded properly');
    }
  }
}
