
import '../models/profile_model.dart';

class ProfileLocalDatasource {
  Future<List<ProfileModel>> getProfileInfo() async {
    Future.delayed(Duration(microseconds: 300));

    return [
      ProfileModel(
        name: "Mohammad Wahab",
        email: "awahabreja@gmail.com",
        complete: 90,
      ),
    ];
  }
}
