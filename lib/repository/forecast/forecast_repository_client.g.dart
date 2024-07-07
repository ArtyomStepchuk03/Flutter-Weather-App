// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'forecast_repository_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _ForecastRepositoryClient implements ForecastRepositoryClient {
  _ForecastRepositoryClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.open-meteo.com/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ForecastDto>? getForecast(
    String latitude,
    String longitude, {
    String currentParams =
        'temperature_2m,relative_humidity_2m,wind_speed_10m,pressure_msl',
    String hourlyParams =
        'temperature_2m,relative_humidity_2m,wind_speed_10m,pressure_msl,cloud_cover',
    String timeFormat = 'unixtime',
    String timezone = 'Europe/Moscow',
    String windSpeedUnit = 'ms',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'latitude': latitude,
      r'longitude': longitude,
      r'current': currentParams,
      r'hourly': hourlyParams,
      r'timeformat': timeFormat,
      r'timezone': timezone,
      r'wind_speed_unit': windSpeedUnit,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ForecastDto>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/forecast',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ForecastDto.fromJson(_result.data!);
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
