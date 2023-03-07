import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _ini = prefs.getBool('ff_ini') ?? _ini;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _photoList = [];
  List<String> get photoList => _photoList;
  set photoList(List<String> _value) {
    _photoList = _value;
  }

  void addToPhotoList(String _value) {
    _photoList.add(_value);
  }

  void removeFromPhotoList(String _value) {
    _photoList.remove(_value);
  }

  void removeAtIndexFromPhotoList(int _index) {
    _photoList.removeAt(_index);
  }

  bool _searchCompleted = false;
  bool get searchCompleted => _searchCompleted;
  set searchCompleted(bool _value) {
    _searchCompleted = _value;
  }

  String _situacao = '';
  String get situacao => _situacao;
  set situacao(String _value) {
    _situacao = _value;
  }

  int _sitNumber = 0;
  int get sitNumber => _sitNumber;
  set sitNumber(int _value) {
    _sitNumber = _value;
  }

  int _clickAtivo = 0;
  int get clickAtivo => _clickAtivo;
  set clickAtivo(int _value) {
    _clickAtivo = _value;
  }

  String _locationStateView = '';
  String get locationStateView => _locationStateView;
  set locationStateView(String _value) {
    _locationStateView = _value;
  }

  double _amount = 0.0;
  double get amount => _amount;
  set amount(double _value) {
    _amount = _value;
  }

  bool _listCompleted = false;
  bool get listCompleted => _listCompleted;
  set listCompleted(bool _value) {
    _listCompleted = _value;
  }

  bool _listProgree = false;
  bool get listProgree => _listProgree;
  set listProgree(bool _value) {
    _listProgree = _value;
  }

  bool _searchNoCompleted = false;
  bool get searchNoCompleted => _searchNoCompleted;
  set searchNoCompleted(bool _value) {
    _searchNoCompleted = _value;
  }

  bool _ini = false;
  bool get ini => _ini;
  set ini(bool _value) {
    _ini = _value;
    prefs.setBool('ff_ini', _value);
  }

  bool _clickativSearch = false;
  bool get clickativSearch => _clickativSearch;
  set clickativSearch(bool _value) {
    _clickativSearch = _value;
  }

  List<String> _location = [];
  List<String> get location => _location;
  set location(List<String> _value) {
    _location = _value;
  }

  void addToLocation(String _value) {
    _location.add(_value);
  }

  void removeFromLocation(String _value) {
    _location.remove(_value);
  }

  void removeAtIndexFromLocation(int _index) {
    _location.removeAt(_index);
  }

  String _address = '';
  String get address => _address;
  set address(String _value) {
    _address = _value;
  }

  String _city = '';
  String get city => _city;
  set city(String _value) {
    _city = _value;
  }

  String _state = '';
  String get state => _state;
  set state(String _value) {
    _state = _value;
  }

  String _zipcode = '';
  String get zipcode => _zipcode;
  set zipcode(String _value) {
    _zipcode = _value;
  }

  String _placeid = '';
  String get placeid => _placeid;
  set placeid(String _value) {
    _placeid = _value;
  }

  String _volume = '';
  String get volume => _volume;
  set volume(String _value) {
    _volume = _value;
  }

  String _clientPay = '';
  String get clientPay => _clientPay;
  set clientPay(String _value) {
    _clientPay = _value;
  }

  String _intentPAy = '';
  String get intentPAy => _intentPAy;
  set intentPAy(String _value) {
    _intentPAy = _value;
  }

  DocumentReference? _inspection;
  DocumentReference? get inspection => _inspection;
  set inspection(DocumentReference? _value) {
    _inspection = _value;
  }

  List<dynamic> _listItemsPDF = [];
  List<dynamic> get listItemsPDF => _listItemsPDF;
  set listItemsPDF(List<dynamic> _value) {
    _listItemsPDF = _value;
  }

  void addToListItemsPDF(dynamic _value) {
    _listItemsPDF.add(_value);
  }

  void removeFromListItemsPDF(dynamic _value) {
    _listItemsPDF.remove(_value);
  }

  void removeAtIndexFromListItemsPDF(int _index) {
    _listItemsPDF.removeAt(_index);
  }

  List<String> _jsonitemlist = [];
  List<String> get jsonitemlist => _jsonitemlist;
  set jsonitemlist(List<String> _value) {
    _jsonitemlist = _value;
  }

  void addToJsonitemlist(String _value) {
    _jsonitemlist.add(_value);
  }

  void removeFromJsonitemlist(String _value) {
    _jsonitemlist.remove(_value);
  }

  void removeAtIndexFromJsonitemlist(int _index) {
    _jsonitemlist.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
