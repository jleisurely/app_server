import 'controller/heroes_controller.dart';
import 'my_app.dart';
import 'heroes.dart';
import 'AppConfig.dart';
import 'model/hero.dart';
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class MyAppChannel extends ApplicationChannel {
  ManagedContext context;
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.


  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final AppConfig _config=AppConfig(options.configurationFilePath);
    options.port=_config.port;
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();//描述应用程序的数据模型
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
        _config.database.username,
        _config.database.password,
        _config.database.host,
        _config.database.port,
        _config.database.databaseName);//管理与单个数据库的连接
    context=ManagedContext(dataModel, psc);

    // final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    // final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
    //     "wangyu", "12345678", "127.0.0.1", 5432, "aqueduct");
    //
    // context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    router
        .route('/heroes/[:id]')
        .link(() => HeroesController(context));
    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    return router;
  }
}