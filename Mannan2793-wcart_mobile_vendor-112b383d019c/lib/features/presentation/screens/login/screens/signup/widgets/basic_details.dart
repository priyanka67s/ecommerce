
import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/sign_up_fields.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/controller/singup_step1controller.dart';

class BasicDetails extends StatelessWidget {
  const BasicDetails({
    super.key,
    required this.controller, required this.formKey,
  });
final GlobalKey<FormState> formKey;
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
        child: ListView(
          shrinkWrap: true,
          children: controller.textControllers.entries.map((entry) {
            debugPrint(entry.key);
            switch (entry.key) {
              case "name":
                return SignUpFields(
                  label1: "FirstName",
                  label2: "LastName",
                  entry1: entry.value,
                  entry2: controller.textControllers["last_name"],
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
              case "email_id":
                return SignUpFields(
                  label1: "Email",
                  label2: "Mobile Number",
                  entry1: entry.value,
                  entry2: controller.textControllers["phone"],
                  validationRules1: [
                    "required",
                    "email",
                  ],
                  validationRules2: [
                    "required",
                    "mobile_number",
                  ],
                  maximumWordCount: 10,
                );
      
              case 'password':
                return SignUpFields(
                  label1: "Password",
                  label2: "Confirm Password",
                  entry1: entry.value,
                  entry2: controller.textControllers["confirmPassword"],
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
              default:
                return Container();
            }
          }).toList(),
        ),
      ),
    );
  }
}