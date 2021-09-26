class Organization {
  final String? id;
  final String? logoUrl;
  final String? name;
  final String? workspaceUrl;

  const Organization({
    this.id,
    this.logoUrl,
    this.name,
    this.workspaceUrl,
  });

  factory Organization.fromMap(Map<String, dynamic> json) => Organization(
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
    return 'Organization(id: $id, logoUrl: $logoUrl, name: $name, workspaceUrl: $workspaceUrl)';
  }
}
