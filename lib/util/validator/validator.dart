class Validator {
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return 'Bagian ini tidak boleh kosong';
    }
    return null;
  }

  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value == null) {
      return 'Bagian ini tidak boleh kosong';
    }

    if (value is String || value == null) {
      if (value.toString() == 'null') return 'Bagian ini tidak boleh kosong';
      if (value.isEmpty) return 'Bagian ini tidak boleh kosong';
    }

    if (value is List) {
      if (value.isEmpty) return 'Bagian ini tidak boleh kosong';
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return 'Email tidak boleh kosong.';

    final isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
    ).hasMatch(value);

    if (!isValidEmail) {
      return 'Masukkan alamat email yang valid.';
    }
    return null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) return 'Password tidak boleh kosong.';

    if (value.length < 8) {
      return 'Password harus terdiri dari minimal 8 karakter.';
    }
    return null;
  }

  static String? confirmPassword(String? value, bool isPasswordMatch) {
    if (value!.isEmpty) {
      return 'Password tidak boleh kosong.';
    }

    if (!isPasswordMatch) {
      return 'password tidak sama';
    }

    return null;
  }

  static String? topUp(String? value) {
    if (value == "") {
      return null;
    }
    int valueTopUp = int.parse(value!.replaceAll(".", ""));
    bool isValueValid = valueTopUp >= 10000 && valueTopUp <= 1000000;
    if (!isValueValid) {
      return 'Jumlah top up tidak valid';
    }

    return null;
  }

  static String? number(String? value) {
    if (value!.isEmpty) return 'Bagian ini tidak boleh kosong';

    final isNumber = RegExp(r'^[0-9]+$').hasMatch(value);
    if (!isNumber) {
      return 'Masukkan angka yang valid.';
    }
    return null;
  }

  static String? atLeastOneitem(List<Map<String, dynamic>> items) {
    final checkedItems = items.where((i) => i['checked'] == true).toList();
    if (checkedItems.isEmpty) {
      return 'Anda harus memilih setidaknya satu item.';
    }
    return null;
  }
}
