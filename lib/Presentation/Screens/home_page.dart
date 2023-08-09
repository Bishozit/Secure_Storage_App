import 'package:flutter/material.dart';
import '../../Data/Local_Storage/secure_storage.dart';
import '../Components/primary_btn.dart';
import '../Components/spacer.dart';
import '../Declarations/constants.dart';

import '../Components/app_bar.dart';
import '../Components/text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTitle: widget.title),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPadding,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.security, color: accentgreen, size: 100),
                HeightSpacer(myHeight: kSpacing),
                Text('Storing data securely using Secure Storage',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: kfontSize,
                        fontWeight: FontWeight.bold,
                        color: accentgreen)),
                HeightSpacer(myHeight: kSpacing * 1),
                TextFormFieldBldr(textEditingController: textEditingController),
                HeightSpacer(myHeight: kSpacing * 1),
                PrimaryBtn(
                    btnText: 'Store Data',
                    btnFun: () {
                      if (textEditingController.text.isNotEmpty) {
                        SecureStorage().writeSecureData(
                            'name', textEditingController.text);
                        textEditingController.text = "";
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No Data available')));
                      }
                    }),
                HeightSpacer(myHeight: kSpacing * 1),
                PrimaryBtn(
                    btnText: 'Read Data',
                    btnFun: () => SecureStorage()
                        .readSecureData('name', textEditingController.text)),
                HeightSpacer(myHeight: kSpacing * 1),
                PrimaryBtn(
                    btnText: 'Delete Data',
                    btnFun: () => SecureStorage().deleteSecureData('name')),
                // HeightSpacer(myHeight: kSpacing * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
