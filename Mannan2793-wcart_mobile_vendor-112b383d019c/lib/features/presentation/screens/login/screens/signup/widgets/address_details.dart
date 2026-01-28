import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/sign_up_fields.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/controller/singup_step1controller.dart';
class AddressDetails extends StatelessWidget {
  const AddressDetails({
    super.key,
    required this.controller,
     required this.formKey,
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
              case "address":
                return SignUpFields(
                  label1: "Address",
                  label2: null,
                  entry1: entry.value,
                  entry2: null,
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
              case "city":
                return SignUpFields(
                  label1: "city",
                  label2: null,
                  entry1: entry.value,
                  entry2: null,
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
      
              case 'state':
                return SignUpFields(
                  label1: "state",
                  label2: "Country",
                  entry1: entry.value,
                  entry2: controller.textControllers["country"],
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
              case 'pincode':
                return SignUpFields(
                  label1: "Pincode",
                  label2: null,
                  entry1: entry.value,
                  entry2: null,
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