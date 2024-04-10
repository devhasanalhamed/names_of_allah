import 'package:names_of_allah/app/data/repository/name_repository.dart';

class RemoteNamesDataSource extends NameRepository {
  @override
  Future<void> favorite() {
    throw UnimplementedError();
  }

  @override
  Future<void> fetchNames() {
    throw UnimplementedError();
  }
}
