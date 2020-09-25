import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String name;
  DateTime startDate;
  DateTime endDate;
  String description;
  List<String> imageUrls;
  String imageAlbumLink;
  List<Location> location;
  Contact contact;

  Event({
    this.name,
    this.startDate,
    this.endDate,
    this.description,
    this.imageUrls,
    this.imageAlbumLink,
    this.location,
    this.contact,
  });

  factory Event.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> eventFirebase = snapshot.data;
    return Event(
      name: eventFirebase['name'],
      startDate: DateTime.fromMicrosecondsSinceEpoch(
          eventFirebase['startDate'].microsecondsSinceEpoch),
      endDate: DateTime.fromMicrosecondsSinceEpoch(
          eventFirebase['endDate'].microsecondsSinceEpoch),
      description: eventFirebase['description'],
      imageUrls: List.from(eventFirebase['imageUrls']),
      contact: Contact.fromMap(eventFirebase['contact']),
      imageAlbumLink: eventFirebase['imageAlbumLink'],
      location: List.from(eventFirebase['location'])
          .map((location) => Location.fromMap(location))
          .toList(),
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.name;
  }
}

enum LOCATION_TYPE { ONLINE, IN_PERSON }

class Location {
  LOCATION_TYPE type;
  String data;
  String title;

  Location({
    this.type,
    this.data,
    this.title
  });

  factory Location.fromMap(Map<String, dynamic> locationFirebase) {
    LOCATION_TYPE type;
    switch (locationFirebase['type']) {
      case 'online':
        type = LOCATION_TYPE.ONLINE;
        break;
      case 'in_person':
      default:
        type = LOCATION_TYPE.IN_PERSON;
    }

    return Location(
        type: type,
        data: locationFirebase['data'],
        title: locationFirebase['title']);
  }
}

class Contact {
  String uid;
  String name;
  String phone;
  String email;

  Contact({
    this.uid,
    this.name,
    this.phone,
    this.email,
  });

  factory Contact.fromMap(Map<String, dynamic> contactFirebase) {
    return Contact(
        uid: contactFirebase['uid'],
        name: contactFirebase['name'],
        phone: contactFirebase['phone'],
        email: contactFirebase['email']);
  }
}
