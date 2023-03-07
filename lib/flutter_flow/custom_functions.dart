import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double? calcPercentual(
  double todos,
  double completo,
) {
  final result1 = completo * 100;
  final percentual = result1 / todos;
  final valorresultante = percentual * 0.0100;
  return valorresultante;
}

String returnPercent(double percentual) {
  final result = percentual * 100;
  String s;
  s = result.toStringAsFixed(2) + '%';

  return s;
}

int? somaSimple(int order) {
  return order + 1;
}

String formatDate(DateTime time) {
  // fomate dateTime month name, day, year

  final _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final DateFormat formatter = DateFormat('EEEE');
  final String wek = formatter.format(time);

  ;
  var number = time.day;
  if (!(number >= 1 && number <= 100)) {
    //here you change the range
    throw Exception('Invalid number');
  }

  if (number >= 11 && number <= 13) {
    return '${_months[time.month - 1].toString()} ${time.day}th, ${time.year.toString()}, ${wek.toString()}';
  }

  switch (number % 10) {
    case 1:
      return '${_months[time.month - 1].toString()} ${time.day}st, ${time.year.toString()}, ${wek.toString()}';
    case 2:
      return '${_months[time.month - 1].toString()} ${time.day}nd, ${time.year.toString()}, ${wek.toString()}';
    case 3:
      return '${_months[time.month - 1].toString()} ${time.day}rd, ${time.year.toString()}, ${wek.toString()}';
    default:
      return '${_months[time.month - 1].toString()} ${time.day}th, ${time.year.toString()}, ${wek.toString()}';
  }
}

int? somarpercentual(double? valor) {
  // somar 3 porcento em cima do valor
  double? valornovo = 0.00;
  double? valortotal = 0.00;

  if (valor != null) {
    valornovo = (valor * 100.0).toDouble();
    valortotal = valornovo * 1.03;
  }
  var z = valortotal.ceil();
  return z;
}

double? somarpercentualFirestore(double? valor) {
  // somar 3 porcento em cima do valor
  double? valornovo = 0.00;

  if (valor != null) {
    valornovo = (valor * 1.03).toDouble();
  }
  return valornovo;
}

String? dolarconverter(double? amount) {
  // dolar amount converter
  if (amount == null) return null;
  if (amount == 0) return '\$0';
  final _currencyFormat = new NumberFormat.currency(
    symbol: "\$",
    decimalDigits: 2,
  );
  return _currencyFormat.format(amount);
}

String criptografar(String password) {
  // criptografar um campo em base64
  return base64Url.encode(utf8.encode(password));
}

String descriptografar(String campo) {
  // descriptografar um campo em base64
  return String.fromCharCodes(base64.decode(campo));
}

dynamic createInvoiceLineJSONObject(
  String location,
  String? date,
  String? type,
  String? volume,
  String? area,
) {
  dynamic json = {};
  json['location'] = location;
  json['date'] = date;
  json['type'] = type;
  json['volume'] = volume;
  json['area'] = area;
  return json;
}

String jsontostring(List<dynamic> jsonlist) {
  // converter json list em string
  var foo = json.encode(jsonlist);
  var bar = foo.toString();
  var result1 = bar.replaceAll(RegExp(']'), '');
  return result1.substring(1);
}

List<dynamic> datatojson(List<SamplesRecord>? data) {
  // list document to json list
  var j = 0;
  var dataList = <dynamic>[];
  for (var k in data!) {
    final newData = <String, dynamic>{
      'location': k.smplLocation,
      'date': k.smplTimedate?.toString(),
      'type': k.smplType,
      'volume': k.smplVolume,
      'area': k.smplArea,
    };
    dataList.add(newData);
  }
  print(json.encode(dataList).toString());
  return dataList;
}

List<String> jsonlist(List<SamplesRecord> data) {
  // transformar lista de documentos em json
  Map<String, dynamic> map = new Map();
  List<dynamic> jsonList = [];
  List<String> stringList = [];

  for (var k in data) {
    final newData = <String, dynamic>{
      'location': k.smplLocation,
      'date': k.smplTimedate?.toString(),
      'type': k.smplType,
      'volume': k.smplVolume,
      'area': k.smplArea,
      'a001': false,
      's001': false,
      't001': false,
      'a002': false,
      's002': false,
      't002': false
    };
    jsonList.add(newData);
  }

  jsonList.forEach((jsonList) {
    stringList.add(jsonEncode(jsonList));
  });

  return stringList;
}
