import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/ApiService/ApiEndPoint.dart';
import '../provider/MatchProvider.dart';

class MatchScreen extends ConsumerWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchAsync = ref.watch(matchListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Match List")),

      body: matchAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text(e.toString())),
        data: (matches) {
          if (matches.isEmpty) {
            return const Center(child: Text("No Matches Found"));
          }

          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: match.logo != null
                      ? Image.network(ApiEndPoint.imagePath(match.logo!))
                      : const Icon(Icons.sports_soccer),

                  title: Text(match.name),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Stadium: ${match.stadium}"),
                      Text("Date: ${match.date}"),
                      Text("Status: ${match.matchStatus}"),
                      Text("Goals: ${match.totalGoals}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
