
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
 class ProfileRepositoryImpl implements ProfileRepository {
 final ProfileLocalDatasource profileLocalDatasource;
  ProfileRepositoryImpl({required this.profileLocalDatasource});

  @override
  Future<List<ProfileEntity>> getProfileData() async {
    final models = await profileLocalDatasource.getProfileInfo();

    return models
        .map(
          (model) => ProfileEntity(
            name: model.name,
            email: model.email,
            complete: model.complete,
          ),
        )
        .toList();
  }
}
