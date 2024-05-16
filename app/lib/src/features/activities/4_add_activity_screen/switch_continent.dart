import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';

ContinentType getContinentFromCountry(String country) {
  switch (country.toUpperCase()) {
    // NorthAmerica
    case 'UNITED STATES':
    case 'USA':
    case 'CANADA':
    case 'MEXICO':
    case 'GUATEMALA':
    case 'CUBA':
    case 'HAITI':
    case 'DOMINICAN REPUBLIC':
    case 'HONDURAS':
    case 'EL SALVADOR':
    case 'NICARAGUA':
    case 'COSTA RICA':
    case 'PANAMA':
    case 'JAMAICA':
    case 'TRINIDAD AND TOBAGO':
    case 'BAHAMAS':
    case 'BELIZE':
    case 'BARBADOS':
    case 'SAINT LUCIA':
    case 'SAINT VINCENT AND THE GRENADINES':
    case 'GRENADA':
    case 'ANTIGUA AND BARBUDA':
    case 'SAINT KITTS AND NEVIS':
    case 'DOMINICA':
    case 'SAINT MARTIN':
    case 'SINT MAARTEN':
    case 'CAYMAN ISLANDS':
    case 'TURKS AND CAICOS ISLANDS':
    case 'BERMUDA':
    case 'ANGUILLA':
    case 'BRITISH VIRGIN ISLANDS':
    case 'UNITED STATES VIRGIN ISLANDS':
    case 'GREENLAND':
    case 'SAINT PIERRE AND MIQUELON':
    case 'FAROE ISLANDS':
    case 'SINT EUSTATIUS':
    case 'SABA':
    case 'SAINT BARTHELEMY':
    case 'CLIPPERTON ISLAND':
      return ContinentType.northAmerica;

// Südamerika
    case 'ARGENTINA':
    case 'BOLIVIA':
    case 'BRAZIL':
    case 'CHILE':
    case 'COLOMBIA':
    case 'ECUADOR':
    case 'GUYANA':
    case 'PARAGUAY':
    case 'PERU':
    case 'SURINAME':
    case 'URUGUAY':
    case 'VENEZUELA':
      return ContinentType.southAmerica;

// Europa
    case 'ALBANIA':
    case 'ANDORRA':
    case 'AUSTRIA':
    case 'BELARUS':
    case 'BELGIUM':
    case 'BOSNIA AND HERZEGOVINA':
    case 'BULGARIA':
    case 'CROATIA':
    case 'CYPRUS':
    case 'CZECH REPUBLIC':
    case 'DENMARK':
    case 'ESTONIA':
    case 'FINLAND':
    case 'FRANCE':
    case 'GERMANY':
    case 'GREECE':
    case 'HUNGARY':
    case 'ICELAND':
    case 'IRELAND':
    case 'ITALY':
    case 'KOSOVO':
    case 'LATVIA':
    case 'LIECHTENSTEIN':
    case 'LITHUANIA':
    case 'LUXEMBOURG':
    case 'MALTA':
    case 'MOLDOVA':
    case 'MONACO':
    case 'MONTENEGRO':
    case 'NETHERLANDS':
    case 'NORTH MACEDONIA':
    case 'NORWAY':
    case 'POLAND':
    case 'PORTUGAL':
    case 'ROMANIA':
    case 'RUSSIA':
    case 'SAN MARINO':
    case 'SERBIA':
    case 'SLOVAKIA':
    case 'SLOVENIA':
    case 'SPAIN':
    case 'SWEDEN':
    case 'SWITZERLAND':
    case 'UKRAINE':
    case 'UNITED KINGDOM':
    case 'VATICAN CITY':
      return ContinentType.europe;

    // Asia
    case 'AFGHANISTAN':
    case 'ARMENIA':
    case 'AZERBAIJAN':
    case 'BAHRAIN':
    case 'BANGLADESH':
    case 'BHUTAN':
    case 'BRUNEI':
    case 'CAMBODIA':
    case 'CHINA':
    case 'CYPRUS':
    case 'GEORGIA':
    case 'INDIA':
    case 'INDONESIA':
    case 'IRAN':
    case 'IRAQ':
    case 'ISRAEL':
    case 'JAPAN':
    case 'JORDAN':
    case 'KAZAKHSTAN':
    case 'KUWAIT':
    case 'KYRGYZSTAN':
    case 'LAOS':
    case 'LEBANON':
    case 'MALAYSIA':
    case 'MALDIVES':
    case 'MONGOLIA':
    case 'MYANMAR':
    case 'NEPAL':
    case 'NORTH KOREA':
    case 'OMAN':
    case 'PAKISTAN':
    case 'PALESTINE':
    case 'PHILIPPINES':
    case 'QATAR':
    case 'SAUDI ARABIA':
    case 'SINGAPORE':
    case 'SOUTH KOREA':
    case 'SRI LANKA':
    case 'SYRIA':
    case 'TAIWAN':
    case 'TAJIKISTAN':
    case 'THAILAND':
    case 'TIMOR-LESTE':
    case 'TURKEY':
    case 'TURKMENISTAN':
    case 'UNITED ARAB EMIRATES':
    case 'UZBEKISTAN':
    case 'VIETNAM':
    case 'YEMEN':
      return ContinentType.asia;

    // Australia and Oceania
    case 'AUSTRALIA':
    case 'PAPUA NEW GUINEA':
    case 'NEW ZEALAND':
    case 'FIJI':
    case 'SOLOMON ISLANDS':
    case 'VANUATU':
    case 'SAMOA':
    case 'KIRIBATI':
    case 'MICRONESIA':
    case 'TONGA':
    case 'MARSHALL ISLANDS':
    case 'PALAU':
    case 'NAURU':
    case 'TUVALU':
    case 'COOK ISLANDS':
    case 'NIUE':
    case 'FEDERATED STATES OF MICRONESIA':
    case 'TAHITI':
    case 'FRENCH POLYNESIA':
    case 'WALLIS AND FUTUNA':
    case 'NEW CALEDONIA':
    case 'NORFOLK ISLAND':
    case 'CHRISTMAS ISLAND':
    case 'COCOS (KEELING) ISLANDS':
    case 'HEARD ISLAND AND MCDONALD ISLANDS':
    case 'PITCAIRN ISLANDS':
    case 'TIMOR-LESTE':
      return ContinentType.australia;

    // Africa
    case 'ALGERIA':
    case 'ANGOLA':
    case 'BENIN':
    case 'BOTSWANA':
    case 'BURKINA FASO':
    case 'BURUNDI':
    case 'CAPE VERDE':
    case 'CAMEROON':
    case 'CENTRAL AFRICAN REPUBLIC':
    case 'CHAD':
    case 'COMOROS':
    case 'CONGO':
    case 'DJIBOUTI':
    case 'EGYPT':
    case 'EQUATORIAL GUINEA':
    case 'ERITREA':
    case 'ESWATINI':
    case 'ETHIOPIA':
    case 'GABON':
    case 'GAMBIA':
    case 'GHANA':
    case 'GUINEA':
    case 'GUINEA-BISSAU':
    case 'IVORY COAST':
    case 'KENYA':
    case 'LESOTHO':
    case 'LIBERIA':
    case 'LIBYA':
    case 'MADAGASCAR':
    case 'MALAWI':
    case 'MALI':
    case 'MAURITANIA':
    case 'MAURITIUS':
    case 'MOROCCO':
    case 'MOZAMBIQUE':
    case 'NAMIBIA':
    case 'NIGER':
    case 'NIGERIA':
    case 'RWANDA':
    case 'SAO TOME AND PRINCIPE':
    case 'SENEGAL':
    case 'SEYCHELLES':
    case 'SIERRA LEONE':
    case 'SOMALIA':
    case 'SOUTH AFRICA':
    case 'SOUTH SUDAN':
    case 'SUDAN':
    case 'TANZANIA':
    case 'TOGO':
    case 'TUNISIA':
    case 'UGANDA':
    case 'ZAMBIA':
    case 'ZIMBABWE':
      return ContinentType.africa;
  }
  return ContinentType.africa;
}
