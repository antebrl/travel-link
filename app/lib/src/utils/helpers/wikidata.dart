import 'package:travel_link/src/utils/helpers/crypto.dart';

class WikidataParser {
  static List<String> getImagesFromWikidataEntity(Map<String, dynamic> data, String wikidataId) {
    // Extract images (P18 is the property for images in Wikidata)
    final claims = data['entities'][wikidataId]['claims'] as Map<String, dynamic>;
    final imageUrls = <String>[];
    if (claims.containsKey('P18')) {
      for (var claim in claims['P18'] as List) {
        final imageName = claim['mainsnak']['datavalue']['value'] as String;
        final imageFileName = imageName.replaceAll(' ', '_');
        final imageNameHash = CryptoHelper.md5(imageFileName);

        // Construct the image URL
        final imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/${imageNameHash[0]}/${imageNameHash.substring(0, 2)}/$imageFileName';

        imageUrls.add(imageUrl);
      }
    }
    return imageUrls;
  }
}
