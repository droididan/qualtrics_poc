import 'package:fpdart/fpdart.dart';

import '../mocks/qualtrics_props.dart';
import '../model/qualtrics_base_params.dart';

abstract class QualtricsOps {
  Future<TaskEither<Exception, Map<String, String>>> initializeProject(
    QualtricsBaseParams params,
  );
  Future<TaskEither<Exception, Map<String, String>>> evaluateIntercept(
    String interceptId,
  );
  Future<TaskEither<Exception, bool>> displayIntercept(
    String interceptId,
  );
  Future<TaskEither<Exception, void>> display();
  Future<TaskEither<Exception, Map<String, String>>> initializeWithExtRefId(
    String brandId,
    String projectId,
    String extRefId,
  );
  Future<TaskEither<Exception, Map<String, Map<String, String>>>>
      evaluateProject();
  Future<TaskEither<Exception, void>> setString(
    String key,
    String value,
  );
  Future<TaskEither<Exception, void>> setNumber(
    String key,
    double value,
  );
  Future<TaskEither<Exception, void>> setDateTime(String key);
  Future<TaskEither<Exception, void>> registerViewVisit(
    String viewName,
  );
  Future sendProperties(QualtricsProperties properties);
}
