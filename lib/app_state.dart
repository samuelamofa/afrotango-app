import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _apiKey = await secureStorage.getString('ff_apiKey') ?? _apiKey;
    });
    await _safeInitAsync(() async {
      _searcheterms =
          await secureStorage.getStringList('ff_searcheterms') ?? _searcheterms;
    });
    await _safeInitAsync(() async {
      _serchedUser = (await secureStorage.getStringList('ff_serchedUser'))
              ?.map((path) => path.ref)
              .toList() ??
          _serchedUser;
    });
    await _safeInitAsync(() async {
      _originalAdio =
          await secureStorage.getString('ff_originalAdio') ?? _originalAdio;
    });
    await _safeInitAsync(() async {
      _originalText =
          await secureStorage.getString('ff_originalText') ?? _originalText;
    });
    await _safeInitAsync(() async {
      _transcribeText =
          await secureStorage.getString('ff_transcribeText') ?? _transcribeText;
    });
    await _safeInitAsync(() async {
      _transcribeAdio =
          await secureStorage.getString('ff_transcribeAdio') ?? _transcribeAdio;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _countryName = '';
  String get countryName => _countryName;
  set countryName(String value) {
    _countryName = value;
  }

  String _speechToTextResponse = '';
  String get speechToTextResponse => _speechToTextResponse;
  set speechToTextResponse(String value) {
    _speechToTextResponse = value;
  }

  String _apiKey =
      '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';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    secureStorage.setString('ff_apiKey', value);
  }

  void deleteApiKey() {
    secureStorage.delete(key: 'ff_apiKey');
  }

  int _timerValue = 0;
  int get timerValue => _timerValue;
  set timerValue(int value) {
    _timerValue = value;
  }

  double _swipx = 1.0;
  double get swipx => _swipx;
  set swipx(double value) {
    _swipx = value;
  }

  List<String> _searcheterms = [];
  List<String> get searcheterms => _searcheterms;
  set searcheterms(List<String> value) {
    _searcheterms = value;
    secureStorage.setStringList('ff_searcheterms', value);
  }

  void deleteSearcheterms() {
    secureStorage.delete(key: 'ff_searcheterms');
  }

  void addToSearcheterms(String value) {
    searcheterms.add(value);
    secureStorage.setStringList('ff_searcheterms', _searcheterms);
  }

  void removeFromSearcheterms(String value) {
    searcheterms.remove(value);
    secureStorage.setStringList('ff_searcheterms', _searcheterms);
  }

  void removeAtIndexFromSearcheterms(int index) {
    searcheterms.removeAt(index);
    secureStorage.setStringList('ff_searcheterms', _searcheterms);
  }

  void updateSearchetermsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searcheterms[index] = updateFn(_searcheterms[index]);
    secureStorage.setStringList('ff_searcheterms', _searcheterms);
  }

  void insertAtIndexInSearcheterms(int index, String value) {
    searcheterms.insert(index, value);
    secureStorage.setStringList('ff_searcheterms', _searcheterms);
  }

  List<DocumentReference> _serchedUser = [];
  List<DocumentReference> get serchedUser => _serchedUser;
  set serchedUser(List<DocumentReference> value) {
    _serchedUser = value;
    secureStorage.setStringList(
        'ff_serchedUser', value.map((x) => x.path).toList());
  }

  void deleteSerchedUser() {
    secureStorage.delete(key: 'ff_serchedUser');
  }

  void addToSerchedUser(DocumentReference value) {
    serchedUser.add(value);
    secureStorage.setStringList(
        'ff_serchedUser', _serchedUser.map((x) => x.path).toList());
  }

  void removeFromSerchedUser(DocumentReference value) {
    serchedUser.remove(value);
    secureStorage.setStringList(
        'ff_serchedUser', _serchedUser.map((x) => x.path).toList());
  }

  void removeAtIndexFromSerchedUser(int index) {
    serchedUser.removeAt(index);
    secureStorage.setStringList(
        'ff_serchedUser', _serchedUser.map((x) => x.path).toList());
  }

  void updateSerchedUserAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    serchedUser[index] = updateFn(_serchedUser[index]);
    secureStorage.setStringList(
        'ff_serchedUser', _serchedUser.map((x) => x.path).toList());
  }

  void insertAtIndexInSerchedUser(int index, DocumentReference value) {
    serchedUser.insert(index, value);
    secureStorage.setStringList(
        'ff_serchedUser', _serchedUser.map((x) => x.path).toList());
  }

  bool _isOptionsExpanded = false;
  bool get isOptionsExpanded => _isOptionsExpanded;
  set isOptionsExpanded(bool value) {
    _isOptionsExpanded = value;
  }

  List<DocumentReference> _memberlist = [];
  List<DocumentReference> get memberlist => _memberlist;
  set memberlist(List<DocumentReference> value) {
    _memberlist = value;
  }

  void addToMemberlist(DocumentReference value) {
    memberlist.add(value);
  }

  void removeFromMemberlist(DocumentReference value) {
    memberlist.remove(value);
  }

  void removeAtIndexFromMemberlist(int index) {
    memberlist.removeAt(index);
  }

  void updateMemberlistAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    memberlist[index] = updateFn(_memberlist[index]);
  }

  void insertAtIndexInMemberlist(int index, DocumentReference value) {
    memberlist.insert(index, value);
  }

  DocumentReference? _productCatigory;
  DocumentReference? get productCatigory => _productCatigory;
  set productCatigory(DocumentReference? value) {
    _productCatigory = value;
  }

  bool _isPriceLowtoHigh = false;
  bool get isPriceLowtoHigh => _isPriceLowtoHigh;
  set isPriceLowtoHigh(bool value) {
    _isPriceLowtoHigh = value;
  }

  bool _isPriceHightoLow = false;
  bool get isPriceHightoLow => _isPriceHightoLow;
  set isPriceHightoLow(bool value) {
    _isPriceHightoLow = value;
  }

  bool _isNewArrival = false;
  bool get isNewArrival => _isNewArrival;
  set isNewArrival(bool value) {
    _isNewArrival = value;
  }

  bool _isTopRated = false;
  bool get isTopRated => _isTopRated;
  set isTopRated(bool value) {
    _isTopRated = value;
  }

  bool _isAZ = false;
  bool get isAZ => _isAZ;
  set isAZ(bool value) {
    _isAZ = value;
  }

  bool _isZA = false;
  bool get isZA => _isZA;
  set isZA(bool value) {
    _isZA = value;
  }

  String _filtercolor = '';
  String get filtercolor => _filtercolor;
  set filtercolor(String value) {
    _filtercolor = value;
  }

  String _filterprice = '';
  String get filterprice => _filterprice;
  set filterprice(String value) {
    _filterprice = value;
  }

  String _filterbrand = '';
  String get filterbrand => _filterbrand;
  set filterbrand(String value) {
    _filterbrand = value;
  }

  String _filterSize = '';
  String get filterSize => _filterSize;
  set filterSize(String value) {
    _filterSize = value;
  }

  String _filterCountry = '';
  String get filterCountry => _filterCountry;
  set filterCountry(String value) {
    _filterCountry = value;
  }

  String _downloadurl = '';
  String get downloadurl => _downloadurl;
  set downloadurl(String value) {
    _downloadurl = value;
  }

  String _originalAdio = '';
  String get originalAdio => _originalAdio;
  set originalAdio(String value) {
    _originalAdio = value;
    secureStorage.setString('ff_originalAdio', value);
  }

  void deleteOriginalAdio() {
    secureStorage.delete(key: 'ff_originalAdio');
  }

  String _originalText = '';
  String get originalText => _originalText;
  set originalText(String value) {
    _originalText = value;
    secureStorage.setString('ff_originalText', value);
  }

  void deleteOriginalText() {
    secureStorage.delete(key: 'ff_originalText');
  }

  String _transcribeText = '';
  String get transcribeText => _transcribeText;
  set transcribeText(String value) {
    _transcribeText = value;
    secureStorage.setString('ff_transcribeText', value);
  }

  void deleteTranscribeText() {
    secureStorage.delete(key: 'ff_transcribeText');
  }

  String _transcribeAdio = '';
  String get transcribeAdio => _transcribeAdio;
  set transcribeAdio(String value) {
    _transcribeAdio = value;
    secureStorage.setString('ff_transcribeAdio', value);
  }

  void deleteTranscribeAdio() {
    secureStorage.delete(key: 'ff_transcribeAdio');
  }

  String _filterProfessionCat = '';
  String get filterProfessionCat => _filterProfessionCat;
  set filterProfessionCat(String value) {
    _filterProfessionCat = value;
  }

  String _filtersearchcountry = '';
  String get filtersearchcountry => _filtersearchcountry;
  set filtersearchcountry(String value) {
    _filtersearchcountry = value;
  }

  bool _isSearchfilter = false;
  bool get isSearchfilter => _isSearchfilter;
  set isSearchfilter(bool value) {
    _isSearchfilter = value;
  }

  String _eventfilterCountry = '';
  String get eventfilterCountry => _eventfilterCountry;
  set eventfilterCountry(String value) {
    _eventfilterCountry = value;
  }

  DateTime? _eventfilterdate;
  DateTime? get eventfilterdate => _eventfilterdate;
  set eventfilterdate(DateTime? value) {
    _eventfilterdate = value;
  }

  String _eventsearchterms = '';
  String get eventsearchterms => _eventsearchterms;
  set eventsearchterms(String value) {
    _eventsearchterms = value;
  }

  DocumentReference? _eventfilterCatigory;
  DocumentReference? get eventfilterCatigory => _eventfilterCatigory;
  set eventfilterCatigory(DocumentReference? value) {
    _eventfilterCatigory = value;
  }

  bool _iseventfilter = false;
  bool get iseventfilter => _iseventfilter;
  set iseventfilter(bool value) {
    _iseventfilter = value;
  }

  DocumentReference? _bussinessfiltercati;
  DocumentReference? get bussinessfiltercati => _bussinessfiltercati;
  set bussinessfiltercati(DocumentReference? value) {
    _bussinessfiltercati = value;
  }

  String _comunityfilterterm = '';
  String get comunityfilterterm => _comunityfilterterm;
  set comunityfilterterm(String value) {
    _comunityfilterterm = value;
  }

  String _eventfilterteam = '';
  String get eventfilterteam => _eventfilterteam;
  set eventfilterteam(String value) {
    _eventfilterteam = value;
  }

  DocumentReference? _communityfiltercatigory;
  DocumentReference? get communityfiltercatigory => _communityfiltercatigory;
  set communityfiltercatigory(DocumentReference? value) {
    _communityfiltercatigory = value;
  }

  String _comunityfiltercountry = '';
  String get comunityfiltercountry => _comunityfiltercountry;
  set comunityfiltercountry(String value) {
    _comunityfiltercountry = value;
  }

  String _bussinesfilterterm = '';
  String get bussinesfilterterm => _bussinesfilterterm;
  set bussinesfilterterm(String value) {
    _bussinesfilterterm = value;
  }

  DocumentReference? _businessfiltercatigory;
  DocumentReference? get businessfiltercatigory => _businessfiltercatigory;
  set businessfiltercatigory(DocumentReference? value) {
    _businessfiltercatigory = value;
  }

  String _bussinesfiltercountry = '';
  String get bussinesfiltercountry => _bussinesfiltercountry;
  set bussinesfiltercountry(String value) {
    _bussinesfiltercountry = value;
  }

  String _businessfiltername = '';
  String get businessfiltername => _businessfiltername;
  set businessfiltername(String value) {
    _businessfiltername = value;
  }

  String _contactsearcterm = '';
  String get contactsearcterm => _contactsearcterm;
  set contactsearcterm(String value) {
    _contactsearcterm = value;
  }

  String _contactcatigory = '';
  String get contactcatigory => _contactcatigory;
  set contactcatigory(String value) {
    _contactcatigory = value;
  }

  String _contactfiltercountry = '';
  String get contactfiltercountry => _contactfiltercountry;
  set contactfiltercountry(String value) {
    _contactfiltercountry = value;
  }

  String _contactfilterprofesio = '';
  String get contactfilterprofesio => _contactfilterprofesio;
  set contactfilterprofesio(String value) {
    _contactfilterprofesio = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
