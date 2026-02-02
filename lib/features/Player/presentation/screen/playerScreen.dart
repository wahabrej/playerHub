import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/features/Player/presentation/provider/PlayerProvider.dart';

class Playerscreen extends ConsumerWidget {
  const Playerscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final playerAsync = ref.watch(playerListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Match List"),
      ),

      body: playerAsync.when(

        // =================
        // Loading
        // =================
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        // =================
        // Error
        // =================
        error: (e, _) => Center(
          child: Text(e.toString()),
        ),

        // =================
        // Success
        // =================
        data: (player) {

          if (player.isEmpty) {
            return const Center(
              child: Text("No player Found"),
            );
          }

          return ListView.builder(
            itemCount: player.length,
            itemBuilder: (context, index) {

              final match = player[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  // leading: match.logo.
                  //     ? Image.network(match.logo)
                  //     : const Icon(Icons.sports_soccer),

                  title: Text(match.name),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Stadium: ${match.username}"),
                      Text("Date: ${match.name}"),
                      Text("Status: ${match.parent_email}"),
                      Text("Goals: ${match.parent_name}"),
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
