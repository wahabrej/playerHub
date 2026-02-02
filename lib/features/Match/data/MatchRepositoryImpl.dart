import 'package:playerhub/features/Match/data/MatchRemoteDataSource.dart';
import 'package:playerhub/features/Match/domain/MatchEntity.dart';
import 'package:playerhub/features/Match/domain/MathRepository.dart';

class MatchRepositoryImpl implements MatchRepository {
  final MatchRemoteDataSource matchRemoteDataSource;

  MatchRepositoryImpl(this.matchRemoteDataSource);

  @override
  Future<List<MatchEntity>> getMatchData() async {
    // Fetch MatchModel from remote
    final model = await matchRemoteDataSource.getMatchData();

    // Make sure matches is not null, otherwise return empty list
    final matchesList = model.matches ?? [];

    // Convert each Matches object to MatchEntity
    return matchesList.map((match) {
      return MatchEntity(
        id: match.id ?? '',
        name: match.teamA?.name ?? '',
        logo: match.teamA?.teamALogo ?? '',
        totalGoals: match.teamA?.totalGoals ?? 0,
        date: match.date ?? '',
        startTime: match.startTime ?? '',
        endTime: match.endTime ?? '',
        stadium: match.stadium ?? '',
        matchStatus: match.matchStatus ?? '',
        status: match.status ?? '',
        votingOpen: match.votingOpen ?? false,
      );
    }).toList();
  }
}
