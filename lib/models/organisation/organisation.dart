class Organisation {
  final String id;
  final String logoUrl;
  final String name;
  final String workspaceUrl;

  const Organisation({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.workspaceUrl,
  });

  factory Organisation.fromMap(Map<String, dynamic> json) => Organisation(
        id: json['id'] ?? json['_id'],
        logoUrl: json['logo_url'],
        name: json['name'],
        workspaceUrl: json['workspace_url'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_url'] = this.logoUrl;
    data['name'] = this.name;
    data['workspace_url'] = this.workspaceUrl;
    return data;
  }

  @override
  String toString() {
    return 'Organisation(id: $id, logoUrl: $logoUrl, name: $name, workspaceUrl: $workspaceUrl)';
  }
}
