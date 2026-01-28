import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({
    super.key,
    required this.entry1,
    this.entry2,
    required this.label1,
    required this.label2,
    required this.validationRules1,
    required this.validationRules2,
    this.maximumWordCount,
  });

  final int? maximumWordCount;
  final TextEditingController entry1;
  final TextEditingController? entry2;
  final String label1;
  final String? label2;

  final List<String> validationRules1;
  final List<String> validationRules2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label1,
                    entry1,
                    validationRules: validationRules1,
                    validatorCallBack: (val) {
                      print(val);
                    },
                  ),
                ],
              ),
            ),
            entry2 != null
                ? const Expanded(flex: 1, child: SizedBox())
                : SizedBox(),
            entry2 != null
                ? Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label2!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          label2!,
                          entry2!,
                          validationRules: validationRules2,
                          validatorCallBack: (val) {
                            print(val);
                          },
                          maximumWordCount: maximumWordCount ?? null,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ],
    );
  }
}
