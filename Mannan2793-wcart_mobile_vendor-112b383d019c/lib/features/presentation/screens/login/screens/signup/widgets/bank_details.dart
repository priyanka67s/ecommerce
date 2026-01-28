import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/sign_up_fields.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/controller/singup_step1controller.dart';
class BankDetails extends StatelessWidget {
  const BankDetails({
    super.key,
    required this.controller, required this.formKey,
  });

  final SignUpController controller;
  final GlobalKey<FormState> formKey;

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
              case "accountholder":
                return SignUpFields(
                  label1: "Account Holder Name",
                  label2: "Account Number",
                  entry1: entry.value,
                  entry2: controller.textControllers["accountnumber"],
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
              case "bankname":
                return SignUpFields(
                  label1: "bank Name",
                  label2: "Bank Branch",
                  entry1: entry.value,
                  entry2: controller.textControllers["bankbranch"],
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
              case "bankcountry":
                return SignUpFields(
                  entry1: entry.value,
                  label1: "Bank Contry",
                  label2: null,
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