import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static final PreferenceService _preferenceService =
      new PreferenceService._internal();
  SharedPreferences prefs;
  bool didInit = false;

  static PreferenceService get() {
    return _preferenceService;
  }

  PreferenceService._internal();

  Future<SharedPreferences> _getPrefs() async {
    if (!didInit) await _init();
    return prefs;
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    didInit = true;
  }

  Future init() async {
    return await _init();
  }

  Future<bool> setVisited(bool visited) async {
    prefs = await _getPrefs();
    return prefs.setBool("VISITED", visited);
  }

  Future<bool> getVisited() async {
    prefs = await _getPrefs();
    return prefs.getBool("VISITED");
  }

  Future<bool> setContact(String contact) async {
    prefs = await _getPrefs();
    return prefs.setString("CONTACT", contact);
  }

  Future<String> getContact() async {
    prefs = await _getPrefs();
    return prefs.getString("CONTACT");
  }

  Future<bool> setVerificationId(String verificationId) async {
    prefs = await _getPrefs();
    return prefs.setString("VERIFICATIONID", verificationId);
  }

  Future<String> getVerificationId() async {
    prefs = await _getPrefs();
    return prefs.getString("VERIFICATIONID");
  }
}
