String? validateEmail({String? email}) {
  if (email == null || email.isEmpty) {
    return "Email is not Empty";
  } else if (email.length < 6) {
    return "Email should be greater than 6 character";
  } else {
    return null;
  }
}
