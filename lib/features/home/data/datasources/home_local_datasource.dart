import '../models/home_item_model.dart';

class HomeLocalDataSource {
  Future<List<HomeItemModel>> getHomeItems() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      HomeItemModel(
        naiScore: 88.0,
        dailyIntakeProgress: 1050,
        sodiumStatus: 'high',
        dailyScores: [
          {'day': '02', 'score': 80.0},
          {'day': '03', 'score': 85.0},
          {'day': '04', 'score': 90.0},
          {'day': '05', 'score': 88.0},
          {'day': '06', 'score': 87.0},
          {'day': '07', 'score': 88.0},
          {'day': '08', 'score': 88.0},
        ],
        completionPercentage: 65.0,
        caloriesNeeded: 2230,
        caloriesEaten: 1750,
      ),
    ];
  }
}