import 'package:flutter_playground/application/core/utils/sha_util.dart';

import '../entities/user.dart';

class CheckUserPinUseCase {


  Future<bool> execute({required String pin, required User user}) async {
    final pinSha256 = ShaUtil.getSha256(pin);
    return user.pin == pinSha256;
  }
}