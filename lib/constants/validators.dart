class Validators {

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter the email';
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    if (value.length > 50) {
      return 'Name must not exceed 50 characters';
    }
    return null;
  }
  static String? validatePreview(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 2) {
      return 'Preview must be at least 2 characters long';
    }
    if (value.length > 50) {
      return 'Preview must not exceed 50 characters';
    }
    return null;
  }
    static String? validateSubject(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Subject';
    }
    if (value.length < 2) {
      return 'Subject must be at least 2 characters long';
    }
    if (value.length > 20) {
      return 'Subject must not exceed 20 characters';
    }
    return null;
  }
}
