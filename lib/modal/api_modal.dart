class DataModal{
   int id;
   String name;
   String description;
   String url;
   String category;
   String language;
   String country;


   DataModal({required this.id,required this.name,required this.description,required this.url,required this.category,required this.language,required this.country,});


   factory DataModal.fromJson(Map<String, dynamic> json) {
     return DataModal(
       id: json['id'],
       name: json['name'],
       description: json['description'],
       url: json['url'],
       category: json['category'],
       language: json['language'],
       country: json['country'],
     );
   }
}

