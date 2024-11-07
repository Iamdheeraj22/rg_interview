class AppMessages {
  AppMessages._internal();

  static final AppMessages _instance = AppMessages._internal();

  factory AppMessages() => _instance;

  static const String sSomeThingWentWrong = 'Something went wrong';
  static const String sPrivacyPolicyAgree =
      'Please agree to the privacy policy with check the checkbox above to continue';
  static const String sRegistrationSuccessVerifyEmail =
      'Registration completed successfully. Please verify your email';
  static const String sUserNotFound = 'No user found for that email.';
  static const String sWrongPassword = 'Wrong password provided for that user.';
  static const String sWeakPassword = 'The password provided is too weak.';
  static const String sAlreadyExistUser =
      'The account already exists for that email.';
  static const String sEmailVerificationMessage =
      'Your registered email is not verified yet. Please verify your email first';
  static const String sInvalidCredential = 'Invalid credential';
  static const String sEmailVerificationSuccess =
      'Email verification link sent successfully, please check your email.';
  static const String sEmailNotRegistered =
      'Email is not registered yet, please sign up first';
  static const String sUserDetailsNotFound = 'User details not found';
  static const String sNotAvailable = 'Not available';
  static const String sEmailNotVerifiedMessage =
      'Your email is not verified yet. Please verify your email first';
}
