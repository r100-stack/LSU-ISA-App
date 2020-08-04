import 'package:isa_app/models/apartment.dart';
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
      case 'pleaseCall':
        return CostType.PLEASE_CALL;
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
      SqftType sqftType = offerFirebase['sqft'] != null
          ? OfferUtils.getSqftType(offerFirebase['sqft'][0])
          : null;

      Offer offer = Offer(
          apartmentId: offerFirebase['apartmentId'],
          availability:
              OfferUtils.getAvailabilityType(offerFirebase['availability']),
          deposit: offerFirebase['deposit'] != null
              ? offerFirebase['deposit'].toDouble()
              : null,
          description: offerFirebase['description'],
          furnished: offerFirebase['furnished'],
          numBeds: offerFirebase['numBeds'] != null
              ? offerFirebase['numBeds'].toDouble()
              : null,
          numBaths: offerFirebase['numBaths'] != null
              ? offerFirebase['numBaths'].toDouble()
              : null,
          petsAllowed: offerFirebase['petsAllowed'],
          sqft: sqftType == null
              ? null
              : Sqft(
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

  static void setApartmentOfferParameters(Offer offer, Apartment apartment) {
    apartment.minBeds =
        (apartment.minBeds == null || offer.numBeds < apartment.minBeds)
            ? offer.numBeds
            : apartment.minBeds;
    apartment.maxBeds =
        (apartment.maxBeds == null || offer.numBeds > apartment.maxBeds)
            ? offer.numBeds
            : apartment.maxBeds;

    apartment.minBaths =
        (apartment.minBaths == null || offer.numBaths < apartment.minBaths)
            ? offer.numBaths
            : apartment.minBaths;
    apartment.maxBaths =
        (apartment.maxBaths == null || offer.numBaths > apartment.maxBaths)
            ? offer.numBaths
            : apartment.maxBaths;

    double minCost = offer.options[0].cost.cost;
    double maxCost = minCost;

    if (apartment.id == '1NlNYt61bi1FBqXJQHBq') {
      int a = 5;
      print('!@#!@#:${apartment.offers.length}');
    }

    if (offer.options.length > 0) {
      if (minCost >= 0) {
        apartment.minCost =
            apartment.minCost == null ? minCost : apartment.minCost;
      }
      if (maxCost >= 0) {
        apartment.maxCost =
            apartment.maxCost == null ? minCost : apartment.maxCost;
      }
    }

    for (Option option in offer.options) {
      minCost = option.cost.cost;
      if (minCost >= 0) {
        apartment.minCost =
            minCost < apartment.minCost ? minCost : apartment.minCost;
      }

      maxCost = option.cost.costMax;
      maxCost = maxCost == null ? minCost : maxCost;

      if (maxCost >= 0) {
        apartment.maxCost =
            maxCost > apartment.maxCost ? maxCost : apartment.maxCost;
      }
    }
  }
}
