import 'package:playerhub/features/home/domain/entities/homeDashBoardEntity.dart';

import '../../domain/entities/home_item_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/Home_remote_data_sources.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<List<HomeMatchEntity>> getHomeItems() async {
    final models = await remote.getMatches();

    // 2. Map the entire list to Entities
    return models.map((model) => HomeMatchEntity(
      id: model.sId ?? '',
      name: model.teamA?.name ?? '',
      logo: model.teamA?.teamALogo,
      totalGoals: model.teamA?.totalGoals ?? 0,
      date: model.date ?? '',
      startTime: model.startTime ?? '',
      endTime: model.endTime ?? '',
      stadium: model.stadium ?? '',
      matchStatus: model.matchStatus ?? '',
      status: model.status ?? '',
      votingOpen: model.votingOpen ?? false,
    )).toList(); // Crucial: .toList() returns the full list of matches
  }
  @override
  @override
  Future<HomeDashboardEntity> getDashBoardData() async {
    final model = await remote.getDashBoardData();

    return HomeDashboardEntity(
      totalPlayer: model.totalPlayer ?? 0,
      totalRegisterPlayer: model.totalRegisterPlayer ?? 0,
      totalMatch: model.totalMatch ?? 0,
      totalParents: model.totalParents ?? 0,
      totalRegisterParents: model.totalRegisterParents ?? 0,
    );
  }
}