import 'package:get_it/get_it.dart';
import 'package:provider_architecutre/core/services/authenticationservice.dart';
import 'package:provider_architecutre/core/services/postservice.dart';
import 'package:provider_architecutre/core/viewmodels/comments_model.dart';
import 'package:provider_architecutre/core/viewmodels/likebutton_model.dart';
import 'core/services/api.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/login_model.dart';

/*
    get_it offeres different ways of how objects are registered that effects the lifetime of the object.
    Accessing an object from anywhere in an App especially can be done by other ways too but:

    If you use a Singleton you cannot easily switch the implementation to another like a mock version for unit tests
    IoC containers for Dependency Injections offer a similar functionality but with the cost of slow start-up time 
    and less readability because you don't know where the magically injected object come from. As most IoC libs rely 
    on reflection they cannot be used with Flutter.

    *FACTORY*
    Factory needs to pass a factory function which returns an instance of an implementation. Each time
    you call it, you will get a new instance returned.

    *Singleton and LazySingleton*
    Singleton and LazySingleton needs to pass an instance of T or a derived class of T which will always
    get returned on a call to get<T>()
    As creating this instance can be time consuming at app start-up, you can shift the create to the time 
    the object is first requested using registerLazySingleton<T>(())

*/

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