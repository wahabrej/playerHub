import 'package:playerhub/features/Match/domain/MatchEntity.dart';

import 'MathRepository.dart';

class MatchUseCase {
  final MatchRepository matchRepository;

  MatchUseCase(this.matchRepository);

  Future<List<MatchEntity>> call() async {
    return matchRepository.getMatchData();
  }
}
