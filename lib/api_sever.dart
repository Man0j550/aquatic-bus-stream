import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const baseURL = 'http://localhost:8080';

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<Map<String, dynamic>> register(
      String username, String email, String phone, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  static Future<Map<String, dynamic>> insertBooking(
      String userEmail,
      String busID,
      String reservedDate,
      int seatsCount,
      String seatsNo,
      int amount) async {
    final response = await http.post(
      Uri.parse('$baseURL/bookings'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userEmail': userEmail,
        'busID': busID,
        'reservedDate': reservedDate,
        'seatsCount': seatsCount,
        'seatsNo': seatsNo,
        'amount': amount,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to insert booking');
    }
  }

  static Future<List<UserBooking>> getUserBookings(String userEmail) async {
    final response = await http.get(
      Uri.parse('$baseURL/user-bookings?userEmail=$userEmail'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => UserBooking.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get user bookings');
    }
  }

  static Future<List<String>> getReservedSeats(
      String date, String busID) async {
    final response = await http.get(
      Uri.parse('$baseURL/reserved-seats?date=$date&busID=$busID'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<String>();
    } else {
      throw Exception('Failed to get reserved seats');
    }
  }

  static Future<List<Bus>> getBuses(
      String date, String source, String destination) async {
    final response = await http.get(
      Uri.parse(
          '$baseURL/buses?date=$date&source=$source&destination=$destination'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Bus.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get buses');
    }
  }
}

class User {
  final String username;
  final String email;
  final String phone;
  final String password;

  User({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['Username'] ?? 'Unknown',
      email: json['Email'] ?? 'Unknown',
      phone: json['Phone'] ?? 'Unknown',
      password: json['Pass'] ?? 'Unknown',
    );
  }
}

class UserBooking {
  final int bookingID;
  final String userEmail;
  final String busID;
  final String reservedDate;
  final String bookedDate;
  final int seatsCount;
  final String seatsNo;
  final int amount;

  UserBooking({
    required this.bookingID,
    required this.userEmail,
    required this.busID,
    required this.reservedDate,
    required this.bookedDate,
    required this.seatsCount,
    required this.seatsNo,
    required this.amount,
  });

  factory UserBooking.fromJson(Map<String, dynamic> json) {
    return UserBooking(
      bookingID: json['BookingID'] ?? 0,
      userEmail: json['UserEmail'] ?? 'Unknown',
      busID: json['BusID'] ?? 'Unknown',
      reservedDate: json['ReservedDate'] ?? 'Unknown',
      bookedDate: json['BookedDate'] ?? 'Unknown',
      seatsCount: json['SeatsCount'] ?? 0,
      seatsNo: json['SeatsNo'] ?? 'Unknown',
      amount: json['Amount'] ?? 0,
    );
  }
}

class Bus {
  final String id;
  final String name;
  final String startTime;
  final String dateAvailable;
  final String source;
  final String destination;
  final int price;

  Bus({
    required this.id,
    required this.name,
    required this.startTime,
    required this.dateAvailable,
    required this.source,
    required this.destination,
    required this.price,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['ID'] ?? 'Unknown',
      name: json['Name'] ?? 'Unknown',
      startTime: json['StartTime'] ?? 'Unknown',
      dateAvailable: json['DateAvailable'] ?? 'Unknown',
      source: json['Source'] ?? 'Unknown',
      destination: json['Destination'] ?? 'Unknown',
      price: json['Price'] ?? 0,
    );
  }
}
