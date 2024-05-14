import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/trip_overview/data/gallery/shared_gallery_repository.dart';
import 'package:travel_link/src/features/trip_overview/presentation/gallery/shared_gallery_controller.dart';

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
      // ignore: unused_result
      ref.refresh(
        fetchPicturePostsProvider(widget.trip.tripId),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sharedGalleryControllerProvider);
    final auth = ref.watch(authRepositoryProvider);

    final webSettings = WebUiSettings(
      context: context,
      viewPort: const CroppieViewPort(
        width: 270, //9
        height: 480, //16
        type: 'rectangle',
      ),
      enableExif: true,
      enableZoom: true,
      showZoomer: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a picture'),
        actions: [
          IconButton(
            onPressed: () async {
              if (state.isLoading) return;
              if (tempUploadImg == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select an image'),
                  ),
                );
                return;
              }
              if (!widget.trip.participants.contains(auth.currentUser?.uid)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You are not a participant of this trip'),
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
                        final CroppedFile? croppedFile =
                            await ImageCropper().cropImage(
                          sourcePath: image.path,
                          aspectRatio: const CropAspectRatio(
                            ratioX: 9,
                            ratioY: 16,
                          ),
                          uiSettings: [
                            webSettings,
                          ],
                        );

                        if (croppedFile != null) {
                          final Uint8List imageBytes =
                              await croppedFile.readAsBytes();
                          setState(() {
                            tempUploadImg = imageBytes;
                            tempImg = croppedFile.path;
                          });
                        }
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
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Add a caption',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                      enabledBorder: OutlineInputBorder(
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
