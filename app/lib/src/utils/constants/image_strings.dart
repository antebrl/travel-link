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

  static const String a = tripDestinationImagePlaceholderUrl;

  static const Map<String, String> categoryImages = {
    'entertainment':
        'https://cdn.discordapp.com/attachments/1231880021287636999/1257678001177624596/EntertainmentActivityIcon.png?ex=6685476a&is=6683f5ea&hm=930bdb0100987756ce07e7c92ce9df487ad311f56cb8307d601e7ec0f7a9a337&',
    'activity': '',
    'catering':
        'https://cdn.discordapp.com/attachments/1231880021287636999/1257678000699342858/CateringActivityIcon.png?ex=66854769&is=6683f5e9&hm=83c122249351c671b6e4733344b5b853618d5a9d24b95642b8198265db4492b1&',
    'education': a,
    'leisure': 'https://cdn.discordapp.com/attachments/1231880021287636999/1257697485162549371/LeisureActivityIcon.png?ex=6685598f&is=6684080f&hm=3d9b990d6fa3d0f8810b0be0b03c95fb8a9fe647795ee788d066527d37c06211&',
    'natural': 'https://cdn.discordapp.com/attachments/1231880021287636999/1257678001399660705/NatureActivityIcon.png?ex=6685476a&is=6683f5ea&hm=197cee85e78d5694bdee0f6a37fb775345062c1e0a701e182b9bd91c426aadb4&',
    'tourism': 'https://cdn.discordapp.com/attachments/1231880021287636999/1257697485489573908/TourismeActivityIcon.png?ex=6685598f&is=6684080f&hm=29fad451e42e894a15a66e9171bf102d7c73cfa5516f2a6586ea19dd95fdfbaa&',
    'religion': 'https://cdn.discordapp.com/attachments/1231880021287636999/1257678001689071718/ReligousActivityIcon.png?ex=6685476a&is=6683f5ea&hm=890ee4792e9fbfd8022667668314653539b5370883d94dc178f30c9189b0bfab&',
    'camping': 'https://cdn.discordapp.com/attachments/1231880021287636999/1257678000405876766/CampingActivityIcon.png?ex=66854769&is=6683f5e9&hm=58f7f1d0f1fc849a5c3fdcc1773693d4ce16c33059f72e5a003014995609c9ed&',
    'sport': 'https://cdn.discordapp.com/attachments/1231880021287636999/1257678001915826287/SportsActivityIcon.png?ex=6685476a&is=6683f5ea&hm=2d7788282cdaf3f454fd39ef5b221aa83dbaaf4365a2277ec1eb65b0e9f90606&',
    'accommodation':
        'https://cdn.discordapp.com/attachments/1231880021287636999/1257677999956951061/AccomodationActivityIcon.png?ex=66854769&is=6683f5e9&hm=31a1aa2b95eadf6db7c9262dc420de1ac1fc2b32a4ef2aa69419417457737f16&',
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
