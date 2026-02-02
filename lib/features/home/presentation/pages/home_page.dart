import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // দুটি প্রোভাইডারকেই ওয়াচ (watch) করুন
    final matchesAsync = ref.watch(homeMatchesProvider);
    final dashboardAsync = ref.watch(dashboardDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Column(
        children: [
          // ১. টপ সাইড ড্যাশবোর্ড সেকশন
          dashboardAsync.when(
            data: (stats) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true, // কলামের ভেতরে ব্যবহারের জন্য জরুরি
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
                children: [
                  _buildStatCard("Players", stats.totalPlayer.toString(), Colors.blue),
                  _buildStatCard("Matches", stats.totalMatch.toString(), Colors.orange),
                  _buildStatCard("Parents", stats.totalParents.toString(), Colors.green),
                  _buildStatCard("Reg. Players", stats.totalRegisterPlayer.toString(), Colors.purple),
                ],
              ),
            ),
            loading: () => const LinearProgressIndicator(),
            error: (err, _) => Text('Stats Error: $err'),
          ),

          const Divider(thickness: 2),

          // ২. ম্যাচ লিস্ট সেকশন
          Expanded(
            child: matchesAsync.when(
              data: (matches) {
                if (matches.isEmpty) return const Center(child: Text('No matches found'));
                return ListView.builder(
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    final match = matches[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: match.logo != null
                            ? Image.network(match.logo!)
                            : const Icon(Icons.sports_soccer),
                        title: Text(match.name),
                        subtitle: Text('${match.date} | ${match.stadium}'),
                        trailing: Text('Goals: ${match.totalGoals}'),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Matches Error: $err')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}