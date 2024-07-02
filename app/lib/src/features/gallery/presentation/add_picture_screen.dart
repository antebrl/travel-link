import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/gallery/data/shared_gallery_repository.dart';
import 'package:travel_link/src/features/gallery/presentation/shared_gallery_controller.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

class AddPictureScreen extends ConsumerStatefulWidget {
  const AddPictureScreen({required this.trip, super.key});

  final Trip trip;

  @override
  ConsumerState<AddPictureScreen> createState() => _AddPictureScreenState();
}

class _AddPictureScreenState extends ConsumerState<AddPictureScreen> {
  late TextEditingController _controller;
  String? tempImg;
  Uint8List? tempUploadImg;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  Future<void> _submit() async {
    final success =
        await ref.read(sharedGalleryControllerProvider.notifier).postPicture(
              description: _controller.text,
              picture: tempUploadImg!,
              tripId: widget.trip.tripId,
            );

    if (success && mounted) {
      ref.invalidate(
        fetchPicturePostsProvider(widget.trip.tripId),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sharedGalleryControllerProvider);
    final auth = ref.watch(authRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.addPicture),
        actions: [
          IconButton(
            onPressed: () async {
              if (state.isLoading) return;
              if (tempUploadImg == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.loc.addPictureSelectImage),
                  ),
                );
                return;
              }
              if (!widget.trip.participants.contains(auth.currentUser?.uid)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.loc.addPictureNotParticipant),
                  ),
                );
                return;
              }
              //POST PICTURE TO FIREBASE
              await _submit();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: GestureDetector(
                    onTap: () async {
                      //ACCESS PICTURE
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                      );

                      if (image != null) {
                          final Uint8List imageBytes =
                              await image.readAsBytes();
                          setState(() {
                            tempUploadImg = imageBytes;
                            tempImg = image.path;
                          });
                      }
                    },
                    child: tempImg != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: kIsWeb
                                ? Image.network(tempImg!)
                                : Image.file(
                                    File(tempImg!),
                                  ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 140,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: context.loc.addPictureCaption,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
