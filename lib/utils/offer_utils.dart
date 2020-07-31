import 'package:isa_app/models/offer.dart';

class OfferUtils {
  static CostType getCostType(String costTypeString) {
    switch (costTypeString) {
      case 'exact':
        return CostType.EXACT;
      case 'from':
        return CostType.FROM;
      case 'range':
        return CostType.RANGE;
    }

    return null;
  }

  static OptionType getOptionType(String optionTypeString) {
    switch (optionTypeString) {
      case 'base':
        return OptionType.BASE;
      case 'addon':
        return OptionType.ADDON;
    }

    return null;
  }

  static AvailabilityType getAvailabilityType(String availabilityTypeString) {
    switch (availabilityTypeString) {
      case 'availableNow':
        return AvailabilityType.AVAILABLE_NOW;
      case 'notAvailable':
        return AvailabilityType.NOT_AVAILABLE;
      case 'availableSoon':
        return AvailabilityType.AVAILABLE_SOON;
    }

    return null;
  }

  static SqftType getSqftType(String sqftTypeString) {
    switch (sqftTypeString) {
      case 'exact':
        return SqftType.EXACT;
      case 'range':
        return SqftType.RANGE;
    }

    return null;
  }

  static List<Offer> getOffers(var offersFirebase) {
    List<Offer> offers = [];

    for (var offerFirebase in offersFirebase) {
      SqftType sqftType = OfferUtils.getSqftType(offerFirebase['sqft'][0]);

      Offer offer = Offer(
          availability:
              OfferUtils.getAvailabilityType(offerFirebase['availability']),
          deposit: offerFirebase['deposit'].toDouble(),
          description: offerFirebase['description'],
          furnished: offerFirebase['furnished'],
          numBeds: offerFirebase['numBeds'].toDouble(),
          numBaths: offerFirebase['numBaths'].toDouble(),
          petsAllowed: offerFirebase['petsAllowed'],
          sqft: Sqft(
            type: sqftType,
            sqft: offerFirebase['sqft'][1].toDouble(),
            sqftMax: sqftType == SqftType.RANGE
                ? offerFirebase['sqft'][2].toDouble()
                : null,
          ),
          options: []);

      for (var optionFirebase in offerFirebase['options']) {
        CostType costType = OfferUtils.getCostType(optionFirebase['cost'][0]);

        offer.options.add(Option(
            name: optionFirebase['name'],
            type: OfferUtils.getOptionType(optionFirebase['type']),
            cost: Cost(
                type: costType,
                cost: optionFirebase['cost'][1].toDouble(),
                costMax: costType == CostType.RANGE
                    ? optionFirebase['cost'][2].toDouble()
                    : null)));
      }

      offers.add(offer);
    }

    return offers;
  }
}
