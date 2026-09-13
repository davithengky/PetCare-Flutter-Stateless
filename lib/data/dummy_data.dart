import '../models/pet_model.dart';

class DummyData {
  static const List<Pet> pets = [
    Pet(
      id: 'p1',
      name: 'Milo',
      species: 'Kucing',
      breed: 'Anggora',
      gender: 'Jantan',
      age: '2 tahun',
      weight: '4.2 kg',
      imageUrl: 'https://placekitten.com/200/200',
    ),
    Pet(
      id: 'p2',
      name: 'Bella',
      species: 'Anjing',
      breed: 'Golden Retriever',
      gender: 'Betina',
      age: '1.5 tahun',
      weight: '18 kg',
      imageUrl: 'https://placedog.net/200/200',
    ),
  ];

  static const List<Doctor> doctors = [
    Doctor(
      id: 'd1',
      name: 'drh. Andini Putri',
      specialization: 'Dokter Hewan Umum',
      location: 'Sidoarjo',
      rating: 4.9,
      imageUrl: 'https://i.pravatar.cc/150?img=47',
    ),
    Doctor(
      id: 'd2',
      name: 'drh. Bagas Wicaksono',
      specialization: 'Spesialis Kucing & Anjing',
      location: 'Surabaya',
      rating: 4.8,
      imageUrl: 'https://i.pravatar.cc/150?img=12',
    ),
    Doctor(
      id: 'd3',
      name: 'drh. Citra Lestari',
      specialization: 'Spesialis Kulit Hewan',
      location: 'Sidoarjo',
      rating: 4.7,
      imageUrl: 'https://i.pravatar.cc/150?img=32',
    ),
  ];

  static const List<Clinic> clinics = [
    Clinic(
      id: 'c1',
      name: 'PetCare Clinic Sidoarjo',
      address: 'Jl. Raya Sidoarjo No. 12',
      rating: 4.8,
      imageUrl: 'https://placehold.co/200x150',
    ),
    Clinic(
      id: 'c2',
      name: 'Animal Health Center Surabaya',
      address: 'Jl. Diponegoro No. 45',
      rating: 4.6,
      imageUrl: 'https://placehold.co/200x150',
    ),
  ];

  static const List<Product> products = [
    Product(
      id: 'pr1',
      name: 'Royal Canin Kitten 1kg',
      category: 'Makanan',
      price: 95000,
      imageUrl: 'https://placehold.co/150x150',
    ),
    Product(
      id: 'pr2',
      name: 'Pasir Kucing Wangi 5L',
      category: 'Perlengkapan',
      price: 45000,
      imageUrl: 'https://placehold.co/150x150',
    ),
    Product(
      id: 'pr3',
      name: 'Vitamin Anjing Aktif',
      category: 'Vitamin',
      price: 60000,
      imageUrl: 'https://placehold.co/150x150',
    ),
    Product(
      id: 'pr4',
      name: 'Mainan Bola Karet',
      category: 'Mainan',
      price: 25000,
      imageUrl: 'https://placehold.co/150x150',
    ),
  ];

  static const List<HealthRecord> healthRecords = [
    HealthRecord(
      id: 'h1',
      petName: 'Milo',
      title: 'Vaksinasi Rabies',
      date: '12 Agustus 2026',
      notes: 'Vaksin berjalan lancar, tidak ada efek samping.',
    ),
    HealthRecord(
      id: 'h2',
      petName: 'Bella',
      title: 'Pemeriksaan Rutin',
      date: '01 September 2026',
      notes: 'Berat badan naik 0.5kg, kondisi sehat.',
    ),
  ];
}