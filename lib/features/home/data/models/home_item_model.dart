class HomeItemModel {
  final double naiScore;
  final int dailyIntakeProgress;
  final String sodiumStatus;
  final List<Map<String, dynamic>> dailyScores;
  final double completionPercentage;
  final int caloriesNeeded;
  final int caloriesEaten;

  HomeItemModel({
    required this.naiScore,
    required this.dailyIntakeProgress,
    required this.sodiumStatus,
    required this.dailyScores,
    required this.completionPercentage,
    required this.caloriesNeeded,
    required this.caloriesEaten,
  });
}