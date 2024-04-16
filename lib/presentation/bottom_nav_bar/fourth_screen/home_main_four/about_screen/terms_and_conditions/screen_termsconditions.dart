import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  // Replace this String with the actual text content from your image

  final String extractedText = '''
  Last updated April 13, 2024

  AGREEMENT TO OUR LEGAL TERMS...

  This is a sample agreement outlining the terms and conditions for using our app. By using our app, you agree to be bound by these terms.

  1. Scope of Agreement
     These terms and conditions govern your use of our mobile application ERMUDE.

  2. User Conduct
     You agree to use the App in a lawful and respectful manner. Prohibited activities include:
     - Uploading illegal content
     - Harassing other users
     - Violating intellectual property rights

  3. Disclaimer of Warranties
     The App is provided "as is" without warranty of any kind. We disclaim all warranties, express or implied, including warranties of merchantability, fitness for a particular purpose, and non-infringement.

  4. Limitation of Liability
     We shall not be liable for any damages arising from your use of the App.

  5. Termination
     We reserve the right to terminate your access to the App at any time without notice.

  6. Governing Law
     These terms and conditions shall be governed by and construed in accordance with the laws of India.

  7. Entire Agreement
     These terms and conditions constitute the entire agreement between you and us regarding your use of the App.

  8. Updates to Terms and Conditions
     We may update these terms and conditions from time to time. Your continued use of the App following any such update constitutes your agreement to the revised terms.

  Please read these terms and conditions carefully before using the App. If you do not agree to these terms, you may not use the App.
''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: const Text(ConstName.appName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'TERMS AND CONDITIONS\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: AppColors.black),
                    ),
                    TextSpan(
                      text: extractedText, // Replace with your actual text
                      style: const TextStyle(
                          fontSize: 16.0, color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
