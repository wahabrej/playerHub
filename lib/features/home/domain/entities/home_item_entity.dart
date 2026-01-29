
class HomeItemEntity {
  final double naiScore;
  final int dailyIntakeProgress;
  final String sodiumStatus; // e.g., 'high' or 'normal'
  final List<Map<String, dynamic>> dailyScores; // [{day: '02', score: 80.0}, ...]
  final double completionPercentage;
  final int caloriesNeeded;
  final int caloriesEaten;

  const HomeItemEntity({
    required this.naiScore,
    required this.dailyIntakeProgress,
    required this.sodiumStatus,
    required this.dailyScores,
    required this.completionPercentage,
    required this.caloriesNeeded,
    required this.caloriesEaten,
  });


}

