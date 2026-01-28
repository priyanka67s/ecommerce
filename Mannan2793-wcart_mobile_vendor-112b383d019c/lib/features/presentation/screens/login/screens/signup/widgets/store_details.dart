import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/widgets/sign_up_fields.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/controller/singup_step1controller.dart';
class StoreDetails extends StatelessWidget {
  const StoreDetails({
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
              case "brandname":
                return SignUpFields(
                  label1: "Brand Name",
                  label2: "Brand Slug",
                  entry1: entry.value,
                  entry2: controller.textControllers["brandslug"],
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                    
                  ],
                );
              case "businesstype":
                return SignUpFields(
                  label1: "Business Type",
                  label2: "Website Url",
                  entry1: entry.value,
                  entry2: controller.textControllers["website"],
                  validationRules1: [
                    "required",
                  ],
                  validationRules2: [
                    "required",
                  ],
                );
      
              case 'registernumber':
                return SignUpFields(
                  label1: "Register Number",
                  label2: "GST Number",
                  entry1: entry.value,
                  entry2: controller.textControllers["gstnumber"],
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