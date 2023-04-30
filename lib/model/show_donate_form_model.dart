class CountriesModel{
  int?id;
  String?iso2;
  String?iso3;
  String?slug;
  String?name;
  String?createdAt;
  String?updatedAt;
  String?nameAr;
  String?phoneCode;

  CountriesModel(
      {this.slug,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.nameAr,
      this.iso2,
      this.iso3,
      this.phoneCode});

  factory CountriesModel.jsonData(data){
    return CountriesModel(
      id:data['id'],
      createdAt:data['created_at'],
      updatedAt:data['updated_at'],
      name:data['name'],
      nameAr:data['ar_name'],
      slug:data['slug'],
      iso3:data['iso3'],
      iso2:data['iso2'],
      phoneCode:data['phonecode'],

    );
  }
}

class CitiesModel{
  int?id;
  String?countryId;
  String?name;
  String?createdAt;
  String?updatedAt;
  String?nameAr;

  CitiesModel(
      {
        this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.nameAr,
        this.countryId
     });

  factory CitiesModel.jsonData(data){
    return CitiesModel(
      id:data['id'],
      createdAt:data['created_at'],
      updatedAt:data['updated_at'],
      name:data['name'],
      nameAr:data['ar_name'],
      countryId:data['country_id'],

    );
  }
}

class CategoriesModel{
  int?id;
  String?image;
  String?parentId;
  String?name;
  String?createdAt;
  String?updatedAt;
  String?nameAr;

  CategoriesModel(
      {
        this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.nameAr,
        this.parentId,
        this.image,
      });

  factory CategoriesModel.jsonData(data){
    return CategoriesModel(
      id:data['id'],
      createdAt:data['created_at'],
      updatedAt:data['updated_at'],
      name:data['name'],
      nameAr:data['ar_name'],
      image:data['image'],
      parentId:data['parent_id'],

    );
  }
}

