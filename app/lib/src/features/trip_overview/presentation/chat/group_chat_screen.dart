import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/trip_overview/data/chat/group_chat_repository.dart';
import 'package:travel_link/src/features/trip_overview/domain/chat_message.dart';
import 'package:travel_link/src/features/trip_overview/presentation/chat/group_chat_controller.dart';
import 'package:travel_link/src/features/trip_overview/presentation/chat/my_message_tile.dart';
import 'package:travel_link/src/features/trip_overview/presentation/chat/reply_message_tile.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class GroupChatScreen extends ConsumerStatefulWidget {
  const GroupChatScreen({required this.trip, super.key});

  final Trip trip;

  @override
  ConsumerState<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends ConsumerState<GroupChatScreen> {
  final TextEditingController _controller = TextEditingController();

  Map<String, Color> userColors = {};

  Future<void> _postMessage() async {
    await ref.read(groupChatControllerProvider.notifier).postMessage(
          message: _controller.text,
          tripId: widget.trip.tripId,
        );

    setState(_controller.clear);
  }

  @override
  Widget build(BuildContext context) {
    final chatMessages = ref.watch(tripChatStreamProvider(widget.trip.tripId));

    return chatMessages.when(
        data: chatScreen,
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: (error, stackTrace) {
          logger.e('Error loading chat', error: error, stackTrace: stackTrace);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Trip Group Chat'),
            ),
            body: const Center(
              child: Text('Error loading chat. Please try again later.'),
            ),
          );
        },);
  }

  Widget chatScreen(List<ChatMessage> messages) {
    final state = ref.watch(groupChatControllerProvider);
    final auth = ref.watch(authRepositoryProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              reverse: true,
              itemBuilder: (context, int i) {
                final chatMessage = messages[i];

                final previousChatMessage =
                    i + 1 < messages.length ? messages[i + 1] : null;

                final nextChatMessage =
                    i > 0 ? messages[i - 1] : null;

                // ignore: avoid_bool_literals_in_conditional_expressions
                final isFirstInSequence = previousChatMessage != null
                    ? previousChatMessage.uid != chatMessage.uid
                    : true;

                final userColor = userColors.putIfAbsent(
                  chatMessage.uid, 
                  () => userNameColors.availableColors[
                    userColors.length % userNameColors.availableColors.length
                  ],
                );

                //don't show timestamp if nextMessage was sent within 3 minutes
                DateTime? timestamp = chatMessage.timestamp;
                if (nextChatMessage != null && 
                    nextChatMessage.uid == chatMessage.uid && 
                    nextChatMessage.timestamp.difference(timestamp) <= const Duration(minutes: 3,)) 
                  {
                  timestamp = null;
                }

                return Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      4,
                      16,
                      (nextChatMessage?.uid == chatMessage.uid) ? 4 : 25,
                    ),
                  child: chatMessage.uid != auth.currentUser?.uid
                      //Mesage by other group member
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: isFirstInSequence
                              ? ReplyMessageTile.first(
                                  uid: chatMessage.uid,
                                  message: chatMessage.message,
                                  timestamp: timestamp,
                                  authorColor: userColor,
                                )
                              : ReplyMessageTile.next(
                                  message: chatMessage.message,
                                  timestamp: timestamp,
                                  authorColor: userColor,
                                ),
                        )
                      //Message by the user himself
                      : Align(
                          alignment: Alignment.topRight,
                          child: isFirstInSequence
                              ? MyMessageTile.first(
                                  message: chatMessage.message,
                                  timestamp: timestamp,
                                )
                              : MyMessageTile.next(
                                  message: chatMessage.message,
                                  timestamp: timestamp,
                                ),
                        ),
                );
              },
            ),
          ),
          if (widget.trip.participants.contains(auth.currentUser?.uid))
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Type message...',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          if (state.isLoading) return;

                          if (_controller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cannot send empty Message.'),
                              ),
                            );
                            return;
                          }

                          if (auth.currentUser?.displayName == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please sign in and assign yourself a name in your profile to send messages.'),
                              ),
                            );
                            return;
                          }

                          _postMessage();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
