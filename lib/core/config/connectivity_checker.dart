import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseCheckInternetConnectivity {
  Future<bool> isConnected();
}

class CheckInternetConnectivity implements BaseCheckInternetConnectivity {
  @override
  Future<bool> isConnected() async {
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }
}
