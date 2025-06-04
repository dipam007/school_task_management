import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Db? db;
  static DbCollection? collection;

  static const String connectionString =
      "mongodb+srv://dipam:Dipam%408849@cluster0.oepzohh.mongodb.net/school_management?retryWrites=true&w=majority";

  static Future<void> connect() async {
    db = await Db.create(connectionString);
    await db!.open();
    collection = db!.collection('users');
    print("MongoDB connected");
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    return await collection!.find().toList();
  }

  static Future<void> addUser(String name, String email) async {
    await collection!.insertOne({"name": name, "email": email});
  }
}
