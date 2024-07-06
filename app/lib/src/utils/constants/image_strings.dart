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
        'https://media.discordapp.net/attachments/1231880021287636999/1257678001177624596/EntertainmentActivityIcon.png?ex=6687ea6a&is=668698ea&hm=96ac03ddbb6cde6fcaab97abf981f48e35637c6b5f1853f0100f572b554279cd&=&format=webp&quality=lossless&width=1024&height=1024',
    'activity':
        'https://media.discordapp.net/attachments/1231880021287636999/1258039682152009789/ActivActivityIcon.png?ex=66869841&is=668546c1&hm=93f6591f487293b2b8b80b1c83d9a3b4164cd5c7ae6b5d6d6b0d56659199553c&=&format=webp&quality=lossless&width=1024&height=1024',
    'catering':
        'https://media.discordapp.net/attachments/1231880021287636999/1257678000699342858/CateringActivityIcon.png?ex=6687ea69&is=668698e9&hm=dc42c323e0204ab6ee2070b2ec56e343353f64f2608a418dba219bde5e5ecb1f&=&format=webp&quality=lossless&width=1024&height=1024',
    'education':
        'https://media.discordapp.net/attachments/1231880021287636999/1258001155145990164/EducationActivityIcon.png?ex=6687c5df&is=6686745f&hm=b857f5d5460a6655c786fc227342be4cf00dfc2f44c09721d16baac6ebd0ba6e&=&format=webp&quality=lossless&width=1024&height=1024',
    'leisure': 'https://media.discordapp.net/attachments/1231880021287636999/1257697485162549371/LeisureActivityIcon.png?ex=668753cf&is=6686024f&hm=f99bab93107c0ddee859fdc49622dc05b403ea25d6293bf0af499b3082f8e038&=&format=webp&quality=lossless&width=1024&height=1024'
      ,
    'natural':
        'https://media.discordapp.net/attachments/1231880021287636999/1257678001399660705/NatureActivityIcon.png?ex=6687ea6a&is=668698ea&hm=fbc98cdfc81c07f007bc8d2c7eeb464253a1ea759a76e7ff68c5e80d16515c0c&=&format=webp&quality=lossless&width=1024&height=1024',
    'tourism':
        'https://media.discordapp.net/attachments/1231880021287636999/1257697485489573908/TourismeActivityIcon.png?ex=668753cf&is=6686024f&hm=8696ba73143509d7870c13c382e59808b237ae9877b3517d396af671ac458506&=&format=webp&quality=lossless&width=1024&height=1024',
    'religion':
        'https://media.discordapp.net/attachments/1231880021287636999/1257678001689071718/ReligousActivityIcon.png?ex=6687ea6a&is=668698ea&hm=6c6543ff3023d042a055bd68bf223f93dfe9cf28fdb678a6559e87bdd909187a&=&format=webp&quality=lossless&width=1024&height=1024',
    'camping':
        'https://media.discordapp.net/attachments/1231880021287636999/1257678000405876766/CampingActivityIcon.png?ex=6687ea69&is=668698e9&hm=68dbbf129ead7f63b419cf2f43efbfec9538ed1199e4bfa1d9191d5bd7ad865d&=&format=webp&quality=lossless&width=1024&height=1024',
    'sport':
        'https://media.discordapp.net/attachments/1231880021287636999/1257678001915826287/SportsActivityIcon.png?ex=6687ea6a&is=668698ea&hm=a4b6cb7cccb643e2a45c24999e74cc2f349a197e26752c7dcc0eb846d06e5234&=&format=webp&quality=lossless&width=1024&height=1024',
    'accommodation':
        'https://media.discordapp.net/attachments/1231880021287636999/1257677999956951061/AccomodationActivityIcon.png?ex=6687ea69&is=668698e9&hm=cf8ddfcd58017bd34d0792bb680a44e6b51162c1b7d4523d1dfe29b3f0f517ef&=&format=webp&quality=lossless&width=1024&height=1024',
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
