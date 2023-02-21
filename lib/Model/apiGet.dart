class apiGet {
  String? sId;
  String? name;
  int? mobile;
  String? email;
  String? pan;
  String? address;
  String? image;
  String? restaurantType;
  bool? isOnline;
  bool? isPopular;
  String? offerText;
  String? createdAt;
  String? updatedAt;
  int? iV;

  apiGet(
      {this.sId,
        this.name,
        this.mobile,
        this.email,
        this.pan,
        this.address,
        this.image,
        this.restaurantType,
        this.isOnline,
        this.isPopular,
        this.offerText,
        this.createdAt,
        this.updatedAt,
        this.iV});

  apiGet.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    pan = json['pan'];
    address = json['address'];
    image = json['image'];
    restaurantType = json['restaurantType'];
    isOnline = json['isOnline'];
    isPopular = json['isPopular'];
    offerText = json['offerText'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['pan'] = this.pan;
    data['address'] = this.address;
    data['image'] = this.image;
    data['restaurantType'] = this.restaurantType;
    data['isOnline'] = this.isOnline;
    data['isPopular'] = this.isPopular;
    data['offerText'] = this.offerText;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}