class Validator {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static ValidationState validate(String input, {required List<String> rules}) {
    for (int i = 0; i < rules.length; i++) {
      final String rule = rules[i];

      // Required field validation
      if (rule == 'required') {
        if (input.trim() == '') {
          return ValidationState(
            error: 'This field is required',
          );
        }
      }

      // Email validation
      if (rule == 'email') {
        if (input == '') {
          return ValidationState(error: 'This field is required');
        }
        if (!_emailRegExp.hasMatch(input)) {
          return ValidationState(error: 'Email format is invalid');
        }
      }

      // Minimum character validation
      if (rule.startsWith('min:')) {
        try {
          final int? letterCount = int.tryParse(rule.replaceAll('min:', ''));
          if (input.length < letterCount!) {
            return ValidationState(
                status: false,
                error: 'Value should be at least $letterCount characters long');
          }
        } catch (_) {
          return ValidationState(status: false, error: ' - $rule is incorrect');
        }
      }

      // Number only validation
      if (rule == 'number_only') {
        final RegExp regex = RegExp(r'^\d+$');
        if (!regex.hasMatch(input)) {
          return ValidationState(status: false, error: 'Value is not a number');
        }
      }

      // Mobile number validation (exactly 10 digits)
      if (rule == 'mobile_number') {
        final RegExp regExp =
            RegExp(r'^\d{10}$'); // Updated to allow exactly 10 digits
        if (input.isEmpty) {
          return ValidationState(error: 'Please enter a mobile number');
        } else if (!regExp.hasMatch(input)) {
          return ValidationState(
              error: 'Please enter a valid 10-digit mobile number');
        }
      }
    }

    return ValidationState(status: true);
  }
}

class ValidationState {
  bool status;
  String? error;

  ValidationState({this.status = false, this.error});
}
