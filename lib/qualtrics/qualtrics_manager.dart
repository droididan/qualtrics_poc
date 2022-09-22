// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';
import 'package:qualtrics_digit/model/qualtrics_base_params.dart';
import 'package:qualtrics_digit/qualtrics/qualtric_ops.dart';
import 'package:qualtrics_digital_flutter_plugin/qualtrics_digital_flutter_plugin.dart';

import '../mocks/qualtrics_props.dart';


class QualtricsManagerImpl implements QualtricsOps {
  final QualtricsDigitalFlutterPlugin qualtrics;

  QualtricsManagerImpl(this.qualtrics);

  @override
  Future<TaskEither<Exception, Map<String, String>>> initializeProject(
    QualtricsBaseParams params,
  ) async =>
      TaskEither.tryCatch(
        () => qualtrics.initializeProject(params.brandId, params.projectId),
        ((error, stackTrace) => Exception(error.toString())),
      );

  @override
  Future<TaskEither<Exception, Map<String, String>>> evaluateIntercept(
    String interceptId,
  ) async =>
      TaskEither.tryCatch(
        () => qualtrics.evaluateIntercept(interceptId),
        ((error, stackTrace) => Exception(error.toString())),
      );

  @override
  Future<TaskEither<Exception, bool>> displayIntercept(
    String interceptId,
  ) async {
    return TaskEither.tryCatch(
      () => qualtrics.displayIntercept(interceptId),
      (error, stackTrace) => Exception(error.toString()),
    );
  }

  @override
  Future<TaskEither<Exception, void>> display() async => TaskEither.tryCatch(
        () => qualtrics.display(),
        (error, stackTrace) => Exception(error.toString()),
      );

  @override
  Future<TaskEither<Exception, Map<String, String>>> initializeWithExtRefId(
    String brandId,
    String projectId,
    String extRefId,
  ) async =>
      TaskEither.tryCatch(
        () => qualtrics.initializeProjectWithExtRefId(
          brandId,
          projectId,
          extRefId,
        ),
        (error, stackTrace) => Exception(error.toString()),
      );

  @override
  Future<TaskEither<Exception, Map<String, Map<String, String>>>>
      evaluateProject() async => TaskEither.tryCatch(
            () => qualtrics.evaluateProject(),
            (error, stackTrace) => Exception(error.toString()),
          );

  @override
  Future<TaskEither<Exception, void>> setString(
    String key,
    String value,
  ) async =>
      TaskEither.tryCatch(
        () => qualtrics.setString(key, value),
        (error, stackTrace) => Exception(error.toString()),
      );

  @override
  Future<TaskEither<Exception, void>> setNumber(
    String key,
    double value,
  ) async =>
      TaskEither.tryCatch(
        () => qualtrics.setNumber(key, value),
        (error, stackTrace) => Exception(error.toString()),
      );

  @override
  Future<TaskEither<Exception, void>> setDateTime(String key) async =>
      TaskEither.tryCatch(
        () => qualtrics.setDateTime(key),
        (error, stackTrace) => Exception(error.toString()),
      );

  @override
  Future<TaskEither<Exception, void>> registerViewVisit(
    String viewName,
  ) async =>
      TaskEither.tryCatch(
        () => qualtrics.registerViewVisit(viewName),
        (error, stackTrace) => Exception(error.toString()),
      );

  @override
  Future sendProperties(QualtricsProperties properties) async {
    try {
      await qualtrics.setString('userId', properties.userId.toString());
      await qualtrics.setString('os', properties.os);
      await qualtrics.setString('osName', properties.osName);
      await qualtrics.setString('country', properties.country);
      await qualtrics.setString('manufacture', properties.manufacture);
      await qualtrics.setString('deviceModel', properties.deviceModel);
      await qualtrics.setString('language', properties.language);
    } on Exception catch (e) {
      print(e);
    }
  }
}
