import 'package:flutter/material.dart';
import 'package:qualtrics_digit/widgets/intercept_details.dart';

import 'locator/get_it_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const FlutterTestApp());
}

class FlutterTestApp extends StatelessWidget {
  const FlutterTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nayax Qualtrics POC',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nayax Qualtrics POC'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: const [InterceptDetails()],
              ),
            ));
          },
        ),
      ),
    );
  }
}
