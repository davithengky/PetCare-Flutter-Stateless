class Pet {
  final String id;
  final String name;
  final String species;
  final String breed;
  final String gender;
  final String age;
  final String weight;
  final String imageUrl;

  const Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.gender,
    required this.age,
    required this.weight,
    required this.imageUrl,
  });
}

class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String location;
  final double rating;
  final String imageUrl;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });
}

class Clinic {
  final String id;
  final String name;
  final String address;
  final double rating;
  final String imageUrl;

  const Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.imageUrl,
  });
}

class Product {
  final String id;
  final String name;
  final String category;
  final int price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });
}

class HealthRecord {
  final String id;
  final String petName;
  final String title;
  final String date;
  final String notes;

  const HealthRecord({
    required this.id,
    required this.petName,
    required this.title,
    required this.date,
    required this.notes,
  });
}