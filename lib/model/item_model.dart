class ItemModel{
  int? id;
  String? userId;
  String? categoryId;
  String? cityId;
  String? title;
  String? address;
  String? description;
  String? validFor;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<ImagesModel>?imagesModel;
  CategoryModel?categoryModel;
  CityModel?cityModel;
  UserModel?userModel;

  ItemModel(
      {this.userModel,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.cityModel,
      this.categoryModel,
      this.imagesModel,
      this.title,
      this.status,
      this.userId,
      this.address,
      this.categoryId,
      this.description,
      this.cityId,
      this.deletedAt,
      this.validFor});

  factory ItemModel.jsonData(data){
    var imagesList = data['images']==null?[]:data['images'] as List;
    List<ImagesModel> images = imagesList.map((tagJson) => ImagesModel.jsonData(tagJson)).toList();


    return ItemModel(
      id:data['id'],
      createdAt:data['created_at'],
      updatedAt:data['updated_at'],
      title:data['title'],
      address:data['address'],
      status:data['status'],
      cityId:data['city_id'],
      deletedAt:data['deleted_at'],
      description:data['description'],
      validFor:data['valid_for'],
      userId:data['user_id'],
      categoryId:data['category_id'],
      categoryModel: data['category']!=null?CategoryModel.jsonData(data['category']):null,
      cityModel: data['city']!=null?CityModel.jsonData(data['city']):null,
      userModel: data['user']!=null?UserModel.jsonData(data['user']):null,
      imagesModel: data['images']!=null?images:null,


    );
  }



}

class UserModel{
int? id;
String? role;
String? name;
String? showName;
String? contactType;
String? mobile;
String? email;
String? emailVerified;
String? mobileVerified;
String? emailVerifiedAt;
String? mobileVerifiedAt;
String? avatar;
String? active;
String? createdAt;
String? updatedAt;

UserModel(
    {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.email,
      this.mobile,
      this.emailVerifiedAt,
      this.active,
      this.avatar,
      this.contactType,
      this.emailVerified,
      this.mobileVerified,
      this.mobileVerifiedAt,
      this.role,
      this.showName});

factory UserModel.jsonData(data){
  return UserModel(
    id:data['id'],
    createdAt:data['created_at'],
    updatedAt:data['updated_at'],
    name:data['name'],
    role:data['role'],
    email:data['email'],
    avatar:data['avatar'],
    active:data['active'],
    mobile:data['mobile'],
    showName:data['show_name'],
    emailVerified:data['email_verified'],
    contactType:data['contact_type'],
    emailVerifiedAt:data['email_verified_at'],
    mobileVerifiedAt:data['mobile_verified_at'],
    mobileVerified:data['mobile_verified'],

  );
}

}

class CityModel{
  int? id;
  String? countryId;
  String? arName;
  String? name;
  String? createdAt;
  String? updatedAt;
  CountryModel?countryModel;

  CityModel(
      {this.countryModel,
      this.name,
      this.arName,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.countryId});

  factory CityModel.jsonData(data){
    return CityModel(
      id:data['id'],
      createdAt:data['created_at'],
      updatedAt:data['updated_at'],
      arName:data['ar_name'],
      name:data['name'],
      countryId:data['country_id'],
      countryModel:data['country']!=null?CountryModel.jsonData(data['country']):null,
    );
  }

}

class CountryModel{
  int?id;
  String?iso2;
  String?iso3;
  String?slug;
  String?name;
  String?createdAt;
  String?updatedAt;
  String?arName;
  String?phoneCode;

  CountryModel(
      {this.name,
      this.arName,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.iso2,
      this.iso3,
      this.phoneCode,
      this.slug});


  factory CountryModel.jsonData(data){
    return CountryModel(
      id:data['id'],
      createdAt:data['created_at'],
      phoneCode:data['phonecode'],
      updatedAt:data['updated_at'],
      iso3:data['iso3'],
      iso2:data['iso2'],
      arName:data['ar_name'],
      name:data['name'],
      slug:data['slug'],
    );
  }
}

class CategoryModel{
  int? id;
  String? parentId;
  String? name;
  String? arName;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.updatedAt,
      this.image,
      this.createdAt,
      this.id,
      this.name,
      this.arName,
      this.parentId});


  factory CategoryModel.jsonData(data){
    return CategoryModel(
      id:data['id'],
      createdAt:data['created_at'],
      image:data['image'],
      updatedAt:data['updated_at'],
      arName:data['ar_name'],
      name:data['name'],
      parentId:data['parent_id'],
    );
  }

}

class ImagesModel{
  int?id;
  String?itemId;
  String?image;
  String?createdAt;
  String?updatedAt;

  ImagesModel(
      {this.id, this.createdAt, this.image, this.updatedAt, this.itemId});

  factory ImagesModel.jsonData(data){
    return ImagesModel(
      id:data['id'],
      createdAt:data['created_at'],
      image:data['image'],
      updatedAt:data['updated_at'],
      itemId:data['item_id'],
    );
  }
}