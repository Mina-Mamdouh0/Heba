class OurVisionModel{
  int?id;
  String?slug;
  String?name;
  String?nameAr;
  String?description;
  String?descriptionAr;
  String?image;
  String?isMenu;
  String?orderNumber;
  String?createdAt;
  String?updatedAt;

  OurVisionModel(
      {this.nameAr, this.name, this.image, this.descriptionAr, this.updatedAt,
        this.createdAt, this.description, this.id, this.slug, this.isMenu, this.orderNumber});

  factory OurVisionModel.jsonData(data){

    return OurVisionModel(
      id:data['id'],
      createdAt:data['created_at'],
      updatedAt:data['updated_at'],
      descriptionAr:data['ar_description'],
      description:data['description'],
      image:data['image'],
      name:data['name'],
      nameAr:data['ar_name'],
      slug:data['slug'],
      isMenu:data['is_menu'],
      orderNumber:data['order_number'],

    );
  }
}