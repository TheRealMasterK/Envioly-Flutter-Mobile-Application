import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start apiStripePay Group Code

class ApiStripePayGroup {
  static String baseUrl = 'https://api.stripe.com/v1/';
  static Map<String, String> headers = {
    'Allow-Origin': '*',
  };
  static CustomersCall customersCall = CustomersCall();
  static CheckoutCall checkoutCall = CheckoutCall();
  static ChecarCall checarCall = ChecarCall();
}

class CustomersCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'customers',
      apiUrl: '${ApiStripePayGroup.baseUrl}customers',
      callType: ApiCallType.POST,
      headers: {
        ...ApiStripePayGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'email': email,
        'name': name,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic idcustomers(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class CheckoutCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? method = '',
    String? mode = '',
    String? currency = '',
    String? name = '',
    int? amount,
    int? quantity,
    String? cancelPage = '',
    String? sucessPage = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'checkout',
      apiUrl: '${ApiStripePayGroup.baseUrl}checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        ...ApiStripePayGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'customer': customer,
        'payment_method_types[0]': method,
        'mode': mode,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][price_data][product_data][name]': name,
        'line_items[0][price_data][unit_amount]': amount,
        'line_items[0][quantity]': quantity,
        'cancel_url': cancelPage,
        'success_url': sucessPage,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
  dynamic payintent(dynamic response) => getJsonField(
        response,
        r'''$.payment_intent''',
      );
  dynamic clientname(dynamic response) => getJsonField(
        response,
        r'''$.customer''',
      );
}

class ChecarCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'checar',
      apiUrl: '${ApiStripePayGroup.baseUrl}charges',
      callType: ApiCallType.GET,
      headers: {
        ...ApiStripePayGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic clientID(dynamic response) => getJsonField(
        response,
        r'''$.data[1].id''',
      );
  dynamic intentPay(dynamic response) => getJsonField(
        response,
        r'''$.data[0].payment_intent''',
      );
}

/// End apiStripePay Group Code

class GetCountryCodeApiCall {
  static Future<ApiCallResponse> call({
    String? latlong = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCountryCodeApi',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlong}&sensor=false&key=AIzaSyDPYBeyI3_9kSODDd9tLFlXq25TookCck0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.results.10005[:].postal_code''',
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.results.10005[:].country_code''',
      );
  static dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$.results.10005[:].latitude''',
      );
  static dynamic long(dynamic response) => getJsonField(
        response,
        r'''$.results.10005[:].longitude''',
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.results.10005[:].city''',
      );
  static dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.results.10005[:].state''',
      );
}

class AutocompleterCall {
  static Future<ApiCallResponse> call({
    String? campo = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'autocompleter',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${campo}&types=address&language=pt_BR&types=%28cities%29&key=AIzaSyDPYBeyI3_9kSODDd9tLFlXq25TookCck0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic desc(dynamic response) => getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      );
  static dynamic placeid(dynamic response) => getJsonField(
        response,
        r'''$.predictions[0].place_id''',
      );
}

class AddressdetailsCall {
  static Future<ApiCallResponse> call({
    String? placeid = '',
    String? keyapi = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addressdetails',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeid}&fields=address_component&key=${keyapi}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic addressname(dynamic response) => getJsonField(
        response,
        r'''$.result.address_components..[0]..long_name''',
      );
  static dynamic bairro(dynamic response) => getJsonField(
        response,
        r'''$.result.address_components..[1]..long_name''',
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.result.address_components..[2]..long_name''',
      );
  static dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.result.address_components..[3]..long_name''',
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.result.address_components..[4]..long_name''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.result.address_components..[5]..long_name''',
      );
  static dynamic postalcode(dynamic response) => getJsonField(
        response,
        r'''$.result.address_components..[7]..long_name''',
      );
}

class CreatepdfCall {
  static Future<ApiCallResponse> call({
    String? token = '#',
    String? company = '#',
    String? clientname = '#',
    String? address = '#',
    String? city = '#',
    String? state = '#',
    String? zip = '#',
    String? phone = '#',
    String? clientemail = '#',
    String? sampledby = '#',
    String? projectname = '#',
    String? payment = '#',
    String? cardtype = '#',
    String? creditnumber = '#',
    String? cardname = '#',
    String? signature = '#',
    String? templateId = '02677b2b233da64e',
    String? pdfname = '#',
    List<String>? jsonitemsList,
  }) {
    final jsonitems = _serializeList(jsonitemsList);

    final body = '''
{
  "template_id": "${templateId}",
  "expiration": 60,
  "output_file": "${pdfname}",
  "data": {
    "company": "${company}",
    "clientname": "${clientname}",
    "address": "${address}",
    "city": "${city}",
    "state": "${state}",
    "zip": "${zip}",
    "phone": "${phone}",
    "clientemail": "${clientemail}",
    "sampledby": "${sampledby}",
    "projectname": "${projectname}",
    "payment": "${payment}",
    "cardtype": "${cardtype}",
    "creditnumber": "${creditnumber}",
    "cardname": "${cardname}",
    "signature": "${signature}",
    "items": ${jsonitems}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createpdf',
      apiUrl: 'https://api.craftmypdf.com/v1/create',
      callType: ApiCallType.POST,
      headers: {
        'X-API-KEY': '${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic fileadd(dynamic response) => getJsonField(
        response,
        r'''$.file''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
