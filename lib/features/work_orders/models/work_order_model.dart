class WorkOrder {
  final int id;
  final String title;
  final String description;
  final String? imageUrl;
  final String status;
  final String createdAt;

  WorkOrder({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.status,
    required this.createdAt,
  });

  factory WorkOrder.fromJson(Map<String, dynamic> json) {
    return WorkOrder(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}
