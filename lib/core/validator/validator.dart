// ignore_for_file: prefer_single_quotes

mixin Validator {
  bool emailValidator(String email){
    return (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email));
  }

  bool passwordValidator(String password) {
    return (password.length >=  8 && RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(password));
  }

  bool confirmPasswordValidator(String password, String password2) {
    return password == password2;
  }

  bool nameValidator(String name) {
    return name.length >= 3;
  }

  bool phoneValidator(String phone) {
    return phone.length > 6;
  }
}