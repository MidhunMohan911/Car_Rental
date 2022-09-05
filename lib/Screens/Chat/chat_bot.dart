import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // try {
        //   dynamic conversationObject = {
        //     'appId':
        //         '16ac24e9679b5be3ebe5910034df7a486', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
        //     'withPreChat': true
        //   };

        //   KommunicateFlutterPlugin.buildConversation(conversationObject)
        //       .then((clientConversationId) {
        //     print("Conversation builder success : " +
        //         clientConversationId.toString());
        //   }).catchError((error) {
        //     print("Conversation builder error : " + error.toString());
        //   });
        // } on Exception catch (e) {}
      }),
    );
  }
}
