import 'package:get_it/get_it.dart';
import 'package:provider_architecutre/core/services/authenticationservice.dart';
import 'package:provider_architecutre/core/services/postservice.dart';
import 'package:provider_architecutre/core/viewmodels/comments_model.dart';
import 'package:provider_architecutre/core/viewmodels/likebutton_model.dart';
import 'core/services/api.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {

  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => LoginModel());

  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => LikeButtonModel());
}