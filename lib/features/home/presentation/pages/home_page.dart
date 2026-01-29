import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeProvider);
    return Scaffold(
      body: SafeArea(
        child: homeAsync.when(
          data: (items) {
            if (items.isEmpty) {
              return const Center(child: Text('No data available'));
            }
            final data = items.first;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          "assets/images/user.png",
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning !',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                          ),
                          Text(
                            'Hello Mohammad',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                          ),
                        ],
                      ),

                      Spacer(),

                      Image.asset("assets/icons/notification.png",height: 20,),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Scan Menu Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.pinkAccent, Colors.orangeAccent],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Scan any menu & get your perfect pick\nBased on your diet goals',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {

                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Scan Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Today's NAI Score",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 140,
                              height: 140,
                              child: CircularProgressIndicator(
                                value: data.naiScore / 100,
                                strokeWidth: 16,
                                backgroundColor: Colors.grey[300],
                                valueColor: const AlwaysStoppedAnimation(
                                  Colors.green,
                                ),
                              ),
                            ),
                            Text(
                              '${data.naiScore.toInt()}',
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '/100',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Daily Intake Progress
                  Text(
                    "Daily Intake Progress ${data.dailyIntakeProgress}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),

                  // Sodium Warning
                  if (data.sodiumStatus == 'high')
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.warning_amber_rounded, color: Colors.red),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Sodium intake high this week',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),

                  // NAI Tracking Graph (simple bar chart for demo)
                  Text(
                    'NAI Score Tracking',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.dailyScores.length,
                      itemBuilder: (context, index) {
                        final day = data.dailyScores[index];
                        final score = day['score'] as double;
                        final isToday =
                            day['day'] == '08'; // Assume last is today
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 40,
                                height: score * 1.5,
                                decoration: BoxDecoration(
                                  color: isToday
                                      ? Colors.redAccent
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                day['day'],
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                '${score.toInt()}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Daily Nutrition Completion
                  Text(
                    'Complete daily nutrition ${data.completionPercentage.toInt()}%',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                   SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: data.completionPercentage / 100,
                    minHeight: 12,
                    backgroundColor: Colors.grey[300],
                    valueColor:  AlwaysStoppedAnimation(Colors.green),
                  ),
                   SizedBox(height: 8),
                  Text(
                    '${data.caloriesEaten} Calories Eaten / ${data.caloriesNeeded} Calories Needed',
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
