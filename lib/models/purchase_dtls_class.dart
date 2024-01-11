class Purchasedetails {
  Purchasedetails({
    this.id,
    this.userId,
    this.name,
    this.userSecret,
    this.purchaseDate,
    this.storeId,
    this.quantity,
    this.purchaseStatus,
    this.updatedAt,
    this.qrFileNameUrl,
  });

  int? id;
  int? userId;
  String? name;
  dynamic userSecret;
  String? purchaseDate;
  dynamic storeId;
  dynamic quantity;
  int? purchaseStatus;
  String? updatedAt;
  String? qrFileNameUrl;

  factory Purchasedetails.fromJson(Map<String, dynamic> json) => Purchasedetails(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    name: json["name"] == null ? null : json["name"],
    userSecret: json["user_secret"] == null ? null : json["user_secret"],
    purchaseDate: json["purchase_date"] == null ? null : json["purchase_date"],
    storeId: json["store_id"] == null ? null : json["store_id"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    purchaseStatus: json["purchase_status"] == null ? null : json["purchase_status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    qrFileNameUrl: json["qr_file_name_url"] == null ? null : json["qr_file_name_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "name": name == null ? null : name,
    "user_secret": userSecret == null ? null : userSecret,
    "purchase_date": purchaseDate == null ? null : purchaseDate,
    "store_id": storeId == null ? null : storeId,
    "quantity": quantity == null ? null : quantity,
    "purchase_status": purchaseStatus == null ? null : purchaseStatus,
    "updated_at": updatedAt == null ? null : updatedAt,
    "qr_file_name_url": qrFileNameUrl == null ? null : qrFileNameUrl,

  };
}
