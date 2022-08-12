import 'package:net_chef/src/configs/app_setup.locator.dart';
import 'package:net_chef/src/services/remote/api_service.dart';
import 'package:net_chef/src/services/remote/firebase_service.dart';
import 'package:net_chef/src/services/remote/network_exceptions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

mixin FirebaseViewModel on BaseViewModel {
  FirebaseService _firebaseService = locator<FirebaseService>();

  FirebaseService get firebaseService => _firebaseService;

}
