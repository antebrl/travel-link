/* -- App Image Strings -- */

/// This class contains all the App Images in String formats.
class CustomImages {
  // -- App Logos
  static const String darkAppLogo = 'assets/logos/.png';
  static const String lightAppLogo = 'assets/logos/.png';

  static const String defaultProfilePictureUrl =
      'https://www.dav-siegerland.de/public/platzhalter/87989/image-thumb__87989__person/person-placeholder.jpg';

  static const String tripDestinationImagePlaceholderUrl =
      'https://lh5.googleusercontent.com/proxy/09fjgEG7U1Lo1E9nkcXeBpiGh3f6XG7mlh9dCcRqcrpItdnXDTj6c-2zjL7uFqkju-d5C0ArEx8t-JVqC43nbDEhvzx5Ec4Wit9QHV3_Nqd5B710Vt0y3p-DYBf1QH9rU8e8dKO21PqouZHVjI-9yVjk5rWikWi_jeg8YE0P14y3r5Dgw_SnVIYTa9-lBNF-47e9GvDFxkmEUGHbuUgGKyASn5djtWNTCyebFUOvdwvcudqWwCPeKJs';

  static const String a = tripDestinationImagePlaceholderUrl;

  static const Map<String, String> categoryImages = {
    'entertainment': a,
    'activity': a,
    'catering': a,
    'education': a,
    'leisure': a,
    'natural': a,
    'tourism': a,
    'religion': a,
    'camping': a,
    'sport': a,
    'accommodation': a,
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
