/* -- App Image Strings -- */

/// This class contains all the App Images in String formats.
class CustomImages {
  // -- App Logos
  static const String darkAppLogo = 'assets/logos/.png';
  static const String lightAppLogo = 'assets/logos/.png';

  //TODO (Ante): Store Images locally
  static const String defaultProfilePictureUrl =
      'https://www.dav-siegerland.de/public/platzhalter/87989/image-thumb__87989__person/person-placeholder.jpg';

  static const String tripDestinationImagePlaceholderUrl =
      'https://lh5.googleusercontent.com/proxy/09fjgEG7U1Lo1E9nkcXeBpiGh3f6XG7mlh9dCcRqcrpItdnXDTj6c-2zjL7uFqkju-d5C0ArEx8t-JVqC43nbDEhvzx5Ec4Wit9QHV3_Nqd5B710Vt0y3p-DYBf1QH9rU8e8dKO21PqouZHVjI-9yVjk5rWikWi_jeg8YE0P14y3r5Dgw_SnVIYTa9-lBNF-47e9GvDFxkmEUGHbuUgGKyASn5djtWNTCyebFUOvdwvcudqWwCPeKJs';

  static const Map<String, String> categoryImages = {
    'entertainment':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/EntertainmentActivityIcon.png?alt=media&token=0cb82df4-4505-4199-92f5-6c6655d59b1b',
    'activity':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/ActivityIcon.png?alt=media&token=8f2415bb-c0c7-4032-89b0-0499d128966f',
    'catering':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/CateringActivityIcon.png?alt=media&token=e11f6651-21d0-464e-be13-d7e6713b581b',
    'education':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/EducationActivityIcon.png?alt=media&token=eabd7dae-2532-4b88-bffe-d0a803831ea3',
    'leisure':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/LeisureActivityIcon.png?alt=media&token=bd3a19f8-c60f-4cf5-89ec-c7edbb3f662f',
    'natural':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/NaturalActivityIcon.png?alt=media&token=db529696-11e9-4953-9489-f4b25bd1af0b',
    'tourism':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/TourismActivityIcon.png?alt=media&token=02e7644c-12f6-4aa5-9ab2-75cae20a9b6f',
    'religion':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/ReligonActivityIcon.png?alt=media&token=2c2d5baf-7e41-4bd0-9836-9aa010f69795',
    'camping':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/CampingActivityIcon.png?alt=media&token=e15fb2a3-7742-4702-afe5-b4f9d8accad6',
    'sport':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/SportActivityIcon.png?alt=media&token=dcce47c3-fc13-4cad-9821-0b3a2fc40d90',
    'accommodation':
        'https://firebasestorage.googleapis.com/v0/b/travel-link1.appspot.com/o/AccomodationActivityIcon.png?alt=media&token=baa19e95-6239-4f63-9c9e-5908da72e2e0',
  };

  static String getPlaceholderImage(List<String> categories) {
    if (categories.isNotEmpty) {
      final category = categories.first;
      return categoryImages[category] ??
          CustomImages.tripDestinationImagePlaceholderUrl;
    }
    return CustomImages.tripDestinationImagePlaceholderUrl;
  }
}
