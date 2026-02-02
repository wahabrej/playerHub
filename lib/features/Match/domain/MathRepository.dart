import 'package:playerhub/features/Match/domain/MatchEntity.dart';

abstract class MatchRepository {

  Future<List<MatchEntity>> getMatchData();
}