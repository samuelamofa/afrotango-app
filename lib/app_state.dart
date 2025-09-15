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
      _searchterms =
          await secureStorage.getStringList('ff_searchterms') ?? _searchterms;
    });
    await _safeInitAsync(() async {
      _searchedUser = (await secureStorage.getStringList('ff_searchedUser'))
              ?.map((path) => path.ref)
              .toList() ??
          _searchedUser;
    });
    await _safeInitAsync(() async {
      _originalAudio =
          await secureStorage.getString('ff_originalAudio') ?? _originalAudio;
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
      _transcribeAudio = await secureStorage.getString('ff_transcribeAudio') ??
          _transcribeAudio;
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

  List<String> _searchterms = [];
  List<String> get searchterms => _searchterms;
  set searchterms(List<String> value) {
    _searchterms = value;
    secureStorage.setStringList('ff_searchterms', value);
  }

  void deleteSearchterms() {
    secureStorage.delete(key: 'ff_searchterms');
  }

  void addToSearchterms(String value) {
    searchterms.add(value);
    secureStorage.setStringList('ff_searchterms', _searchterms);
  }

  void removeFromSearchterms(String value) {
    searchterms.remove(value);
    secureStorage.setStringList('ff_searchterms', _searchterms);
  }

  void removeAtIndexFromSearchterms(int index) {
    searchterms.removeAt(index);
    secureStorage.setStringList('ff_searchterms', _searchterms);
  }

  void updateSearchtermsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchterms[index] = updateFn(_searchterms[index]);
    secureStorage.setStringList('ff_searchterms', _searchterms);
  }

  void insertAtIndexInSearchterms(int index, String value) {
    searchterms.insert(index, value);
    secureStorage.setStringList('ff_searchterms', _searchterms);
  }

  List<DocumentReference> _searchedUser = [];
  List<DocumentReference> get searchedUser => _searchedUser;
  set searchedUser(List<DocumentReference> value) {
    _searchedUser = value;
    secureStorage.setStringList(
        'ff_searchedUser', value.map((x) => x.path).toList());
  }

  void deleteSearchedUser() {
    secureStorage.delete(key: 'ff_searchedUser');
  }

  void addToSearchedUser(DocumentReference value) {
    searchedUser.add(value);
    secureStorage.setStringList(
        'ff_searchedUser', _searchedUser.map((x) => x.path).toList());
  }

  void removeFromSearchedUser(DocumentReference value) {
    searchedUser.remove(value);
    secureStorage.setStringList(
        'ff_searchedUser', _searchedUser.map((x) => x.path).toList());
  }

  void removeAtIndexFromSearchedUser(int index) {
    searchedUser.removeAt(index);
    secureStorage.setStringList(
        'ff_searchedUser', _searchedUser.map((x) => x.path).toList());
  }

  void updateSearchedUserAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    searchedUser[index] = updateFn(_searchedUser[index]);
    secureStorage.setStringList(
        'ff_searchedUser', _searchedUser.map((x) => x.path).toList());
  }

  void insertAtIndexInSearchedUser(int index, DocumentReference value) {
    searchedUser.insert(index, value);
    secureStorage.setStringList(
        'ff_searchedUser', _searchedUser.map((x) => x.path).toList());
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

  DocumentReference? _productCategory;
  DocumentReference? get productCategory => _productCategory;
  set productCategory(DocumentReference? value) {
    _productCategory = value;
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

  String _originalAudio = '';
  String get originalAudio => _originalAudio;
  set originalAudio(String value) {
    _originalAudio = value;
    secureStorage.setString('ff_originalAudio', value);
  }

  void deleteOriginalAudio() {
    secureStorage.delete(key: 'ff_originalAudio');
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

  String _transcribeAudio = '';
  String get transcribeAudio => _transcribeAudio;
  set transcribeAudio(String value) {
    _transcribeAudio = value;
    secureStorage.setString('ff_transcribeAudio', value);
  }

  void deleteTranscribeAudio() {
    secureStorage.delete(key: 'ff_transcribeAudio');
  }

  String _filterProfessionCategory = '';
  String get filterProfessionCategory => _filterProfessionCategory;
  set filterProfessionCategory(String value) {
    _filterProfessionCategory = value;
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

  DocumentReference? _eventfilterCategory;
  DocumentReference? get eventfilterCategory => _eventfilterCategory;
  set eventfilterCategory(DocumentReference? value) {
    _eventfilterCategory = value;
  }

  bool _iseventfilter = false;
  bool get iseventfilter => _iseventfilter;
  set iseventfilter(bool value) {
    _iseventfilter = value;
  }

  DocumentReference? _bussinessfiltercategory;
  DocumentReference? get bussinessfiltercategory => _bussinessfiltercategory;
  set bussinessfiltercategory(DocumentReference? value) {
    _bussinessfiltercategory = value;
  }

  String _communityfilterterm = '';
  String get communityfilterterm => _communityfilterterm;
  set communityfilterterm(String value) {
    _communityfilterterm = value;
  }

  String _eventfilterteam = '';
  String get eventfilterteam => _eventfilterteam;
  set eventfilterteam(String value) {
    _eventfilterteam = value;
  }

  DocumentReference? _communityfiltercategory;
  DocumentReference? get communityfiltercategory => _communityfiltercategory;
  set communityfiltercategory(DocumentReference? value) {
    _communityfiltercategory = value;
  }

  String _communityfiltercountry = '';
  String get communityfiltercountry => _communityfiltercountry;
  set communityfiltercountry(String value) {
    _communityfiltercountry = value;
  }

  String _bussinesfilterterm = '';
  String get bussinesfilterterm => _bussinesfilterterm;
  set bussinesfilterterm(String value) {
    _bussinesfilterterm = value;
  }

  DocumentReference? _businessfiltercategory;
  DocumentReference? get businessfiltercategory => _businessfiltercategory;
  set businessfiltercategory(DocumentReference? value) {
    _businessfiltercategory = value;
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

  String _contactsearchterm = '';
  String get contactsearchterm => _contactsearchterm;
  set contactsearchterm(String value) {
    _contactsearchterm = value;
  }

  String _contactcategory = '';
  String get contactcategory => _contactcategory;
  set contactcategory(String value) {
    _contactcategory = value;
  }

  String _contactfiltercountry = '';
  String get contactfiltercountry => _contactfiltercountry;
  set contactfiltercountry(String value) {
    _contactfiltercountry = value;
  }

  String _contactfilterprofession = '';
  String get contactfilterprofession => _contactfilterprofession;
  set contactfilterprofession(String value) {
    _contactfilterprofession = value;
  }

  bool _isFilter = false;
  bool get isFilter => _isFilter;
  set isFilter(bool value) {
    _isFilter = value;
  }

  String _NameFilter = '';
  String get NameFilter => _NameFilter;
  set NameFilter(String value) {
    _NameFilter = value;
  }

  String _CountryFilter = '';
  String get CountryFilter => _CountryFilter;
  set CountryFilter(String value) {
    _CountryFilter = value;
  }

  DateTime? _DateFilter;
  DateTime? get DateFilter => _DateFilter;
  set DateFilter(DateTime? value) {
    _DateFilter = value;
  }

  String _CategoryFilter = '';
  String get CategoryFilter => _CategoryFilter;
  set CategoryFilter(String value) {
    _CategoryFilter = value;
  }

  List<String> _country = [];
  List<String> get country => _country;
  set country(List<String> value) {
    _country = value;
  }

  void addToCountry(String value) {
    country.add(value);
  }

  void removeFromCountry(String value) {
    country.remove(value);
  }

  void removeAtIndexFromCountry(int index) {
    country.removeAt(index);
  }

  void updateCountryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    country[index] = updateFn(_country[index]);
  }

  void insertAtIndexInCountry(int index, String value) {
    country.insert(index, value);
  }

  List<String> _categoryFiltr = [];
  List<String> get categoryFiltr => _categoryFiltr;
  set categoryFiltr(List<String> value) {
    _categoryFiltr = value;
  }

  void addToCategoryFiltr(String value) {
    categoryFiltr.add(value);
  }

  void removeFromCategoryFiltr(String value) {
    categoryFiltr.remove(value);
  }

  void removeAtIndexFromCategoryFiltr(int index) {
    categoryFiltr.removeAt(index);
  }

  void updateCategoryFiltrAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoryFiltr[index] = updateFn(_categoryFiltr[index]);
  }

  void insertAtIndexInCategoryFiltr(int index, String value) {
    categoryFiltr.insert(index, value);
  }

  List<String> _dateFiltr = [];
  List<String> get dateFiltr => _dateFiltr;
  set dateFiltr(List<String> value) {
    _dateFiltr = value;
  }

  void addToDateFiltr(String value) {
    dateFiltr.add(value);
  }

  void removeFromDateFiltr(String value) {
    dateFiltr.remove(value);
  }

  void removeAtIndexFromDateFiltr(int index) {
    dateFiltr.removeAt(index);
  }

  void updateDateFiltrAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dateFiltr[index] = updateFn(_dateFiltr[index]);
  }

  void insertAtIndexInDateFiltr(int index, String value) {
    dateFiltr.insert(index, value);
  }

  List<String> _nameFiltr = [];
  List<String> get nameFiltr => _nameFiltr;
  set nameFiltr(List<String> value) {
    _nameFiltr = value;
  }

  void addToNameFiltr(String value) {
    nameFiltr.add(value);
  }

  void removeFromNameFiltr(String value) {
    nameFiltr.remove(value);
  }

  void removeAtIndexFromNameFiltr(int index) {
    nameFiltr.removeAt(index);
  }

  void updateNameFiltrAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nameFiltr[index] = updateFn(_nameFiltr[index]);
  }

  void insertAtIndexInNameFiltr(int index, String value) {
    nameFiltr.insert(index, value);
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
