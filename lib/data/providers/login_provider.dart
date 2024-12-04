import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stimassign/core/core_services/path_presis.dart';
import 'package:stimassign/core/core_services/progress_presis.dart';
import '../models/user_model.dart';


class LoginViewModel extends StateNotifier<UserModel?> {
  final UserProgressStorage _storageService;
  String? get username => state?.username;
  LoginViewModel(this._storageService) : super(null);

  Future<void> login(String username) async {
    await _storageService.saveUsername(username);
    state = UserModel(username: username);
  }

  Future<void> logout() async {
    state = null;

  }

  Future<void> loadUser() async {
    final username = await _storageService.getUsername();
    if (username != null) {
      state = UserModel(username: username);
    }
  }
}

final localStorageProvider = Provider<UserProgressStorage>((ref) {
  return UserProgressStorage();
});

final loginViewModelProvider =
StateNotifierProvider<LoginViewModel, UserModel?>((ref) {
  final storageService = ref.watch(localStorageProvider);
  return LoginViewModel(storageService);
});
