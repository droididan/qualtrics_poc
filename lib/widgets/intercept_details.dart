// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualtrics_digit/mocks/qualtrics_props.dart';

import '../locator/get_it_locator.dart';
import '../mocks/param_mock.dart';
import '../model/qualtrics_base_params.dart';
import '../qualtrics/qualtrics_manager.dart';

class InterceptDetails extends StatefulWidget {
  const InterceptDetails({Key? key}) : super(key: key);

  @override
  _InterceptDetailsState createState() => _InterceptDetailsState();
}

class _InterceptDetailsState extends State<InterceptDetails> {
  String brandId = '';
  String zoneId = '';
  String interceptId = '';

  final _brandIdController = TextEditingController(text: mockedParams.brandId);
  final _zoneIdController = TextEditingController(text: mockedParams.projectId);
  final _interceptIdController = TextEditingController(text: mockInterceptId);
  final _resultTextFieldController = TextEditingController();
  final _extRefIdTextFieldController = TextEditingController();
  final _stringCustomPropertyKeyController = TextEditingController();
  final _stringCustomPropertyValueController = TextEditingController();
  final _numberCustomPropertyKeyController = TextEditingController();
  final _numberCustomPropertyValueController = TextEditingController();
  final _viewNameController = TextEditingController();
  final _dateNameKeyController = TextEditingController();

  final qualtrics = sl<QualtricsManagerImpl>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: const Text('Send Properties'),
            onPressed: () => qualtrics.sendProperties(
              mockProperties.first,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTextField(
                "brandId",
                _brandIdController,
              ),
              const SizedBox(width: 10.0),
              _getTextField(
                "zoneId",
                _zoneIdController,
              ),
              const SizedBox(width: 10.0),
              _getTextField(
                "interceptId",
                _interceptIdController,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getTextField("extRefId", _extRefIdTextFieldController),
                const SizedBox(width: 10.0),
                _getTextButton(
                  "InitializeWithExtRefId",
                  _initializeWithExtRefId,
                  CupertinoColors.activeBlue,
                )
              ]),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTextButton(
                "Initialize Project",
                _initializeProject,
                CupertinoColors.activeBlue,
              ),
              const SizedBox(width: 10.0),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTextButton(
                "Evaluate Intercept",
                _evaluateIntercept,
                CupertinoColors.activeBlue,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: _getTextButton(
                  "Display Intercept",
                  _displayIntercept,
                  CupertinoColors.activeGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getTextButton(
                "Evaluate Project",
                _evaluateProject,
                CupertinoColors.activeBlue,
              ),
              _getTextButton(
                "Display",
                _display,
                CupertinoColors.activeBlue,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTextField("StringKey", _stringCustomPropertyKeyController),
              const SizedBox(width: 10.0),
              _getTextField(
                  "StringValue", _stringCustomPropertyValueController),
              const SizedBox(width: 10.0),
              _getTextButton(
                "SetString",
                _setString,
                CupertinoColors.activeBlue,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTextField("NumberKey", _numberCustomPropertyKeyController),
              const SizedBox(width: 10.0),
              _getTextField(
                  "NumberValue", _numberCustomPropertyValueController),
              const SizedBox(width: 10.0),
              _getTextButton(
                "SetNumber",
                _setNumber,
                CupertinoColors.activeBlue,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTextField("DateKey", _dateNameKeyController),
              const SizedBox(width: 10.0),
              _getTextButton(
                "SetDateTime",
                _setDateTime,
                CupertinoColors.activeBlue,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTextField("viewName", _viewNameController),
              const SizedBox(width: 10.0),
              _getTextButton(
                "RegisterViewVisit",
                _registerViewVisit,
                CupertinoColors.activeBlue,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: TextField(
                  key: const Key("resultBox"),
                  enabled: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                  minLines: 3,
                  controller: _resultTextFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTextField(String hintText, TextEditingController controller) {
    return Flexible(
        child: TextField(
      controller: controller,
      key: Key(hintText),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: hintText,
      ),
    ));
  }

  Widget _getTextButton(
    String buttonText,
    Function() onPress,
    CupertinoDynamicColor color,
  ) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: color,
      onPressed: onPress,
      key: Key(buttonText),
      child: Text(buttonText),
    );
  }

  Future<void> _initializeProject() async {
    final initResult = await qualtrics.initializeProject(
      QualtricsBaseParams(
        brandId: _brandIdController.text,
        projectId: _zoneIdController.text,
      ),
    );

    initResult.run().then(
          (value) => value.fold(
            (l) => null,
            (r) => _resultTextFieldController.text = r.toString(),
          ),
        );
  }

  Future<void> _initializeWithExtRefId() async {
    final initResult = await qualtrics.initializeWithExtRefId(
      _brandIdController.text,
      _zoneIdController.text,
      _extRefIdTextFieldController.text,
    );

    initResult.run().then(
          (value) => value.fold(
            (l) => null,
            (r) => _resultTextFieldController.text = r.toString(),
          ),
        );
  }

  Future<void> _evaluateProject() async {
    final result = await qualtrics.evaluateProject();
    result.run().then(
          (value) => value.fold(
            (l) => null,
            (r) {
              for (var interceptId in r.keys) {
                final targetingResult = r[interceptId]!.cast<String, String>();
                final passed = targetingResult["passed"];
                final surveyUrl = targetingResult["surveyUrl"];
                _resultTextFieldController.text =
                    '$r\n$interceptId: passed: $passed surveyUrl: $surveyUrl';
              }
            },
          ),
        );
  }

  Future<void> _evaluateIntercept() async {
    final task = await qualtrics.evaluateIntercept(_interceptIdController.text);
    task.run().then(
          (value) => value.fold(
            (l) => null,
            (r) {
              final result =
                  '${r["interceptId"]}: passed: ${r["passed"]}, surveyUrl: ${r["surveyUrl"]}';
              _resultTextFieldController.text = result;
            },
          ),
        );
  }

  Future<void> _display() async {
    final displayed = await qualtrics.display();
    displayed.run();
  }

  Future<void> _displayIntercept() async {
    final result =
        await qualtrics.displayIntercept(_interceptIdController.text);
    result.run();
  }

  Future<void> _setString() async {
    final task = await qualtrics.setString(
      _stringCustomPropertyKeyController.text,
      _stringCustomPropertyValueController.text,
    );

    task.run();
  }

  Future<void> _setNumber() async {
    final task = await qualtrics.setNumber(
      _numberCustomPropertyKeyController.text,
      double.parse(
        _numberCustomPropertyValueController.text,
      ),
    );
    task.run();
  }

  Future<void> _setDateTime() async {
    final task = await qualtrics.setDateTime(_dateNameKeyController.text);
    task.run();
  }

  Future<void> _registerViewVisit() async {
    final task = await qualtrics.registerViewVisit(_viewNameController.text);
    task.run();
  }
}
