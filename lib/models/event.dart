class Event {
  String name;
  DateTime startDate;
  DateTime endDate;
  String description;
  List<String> imageUrls;
  String imageAlbumLink;
  Map<String, String> location;
  Map<String, String> contact;
  
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
}
