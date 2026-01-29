import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileInfo {
  final ProfileRepository profileRepository;

  GetProfileInfo(this.profileRepository);
  Future<List<ProfileEntity>> call() async {
    return profileRepository.getProfileData();
  }
}
