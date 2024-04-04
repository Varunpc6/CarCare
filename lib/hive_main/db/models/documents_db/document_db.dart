import 'package:hive/hive.dart';

part 'document_db.g.dart';

@HiveType(typeId: 10)
class DocumentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? imageDoc;

  @HiveField(2)
  String? nameDoc;

  DocumentModel({
    required this.imageDoc,
    required this.nameDoc, int? id,
  });
}
