class ContactModel{
  int?id;
  String?name;
  String?nameAr;
  String?description;
  String?descriptionAr;
  String?image;
  String?email;
  String?mobile;
  String?address;
  String?addressAr;
  String?location;
  String?facebook;
  String?instagram;
  String?snapchat;
  String?tiktok;
  String?youtube;
  String?createdAt;
  String?updatedAt;

  ContactModel({this.name, this.id, this.description, this.email,
    this.address, this.image, this.createdAt, this.updatedAt,
    this.mobile, this.descriptionAr, this.addressAr, this.facebook,
    this.instagram, this.location, this.nameAr, this.snapchat,
    this.tiktok, this.youtube});

  factory ContactModel.jsonData(data){

    return ContactModel(
      id:data['id'],
      createdAt:data['created_at'],
      updatedAt:data['updated_at'],
      addressAr:data['ar_address'],
      address:data['address'],
      mobile:data['mobile'],
      email:data['email'],
      descriptionAr:data['ar_description'],
      description:data['description'],
      image:data['image'],
      youtube:data['youtube'],
      location:data['location'],
      name:data['name'],
      nameAr:data['ar_name'],
      tiktok:data['tiktok'],
      snapchat:data['snapchat'],
      instagram:data['instagram'],
      facebook:data['facebook'],
    );
  }
}
