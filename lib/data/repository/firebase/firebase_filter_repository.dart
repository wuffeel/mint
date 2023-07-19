import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart';
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart';
import 'package:mint/data/repository/abstract/filter_repository.dart';

@Injectable(as: FilterRepository)
class FirebaseFilterRepository implements FilterRepository {
  final _firestoreInstance = FirebaseFirestore.instance;

  static const _filterCollection = 'filter';

  static const _filterId = 'specialist_filter';
  static const _pickUpId = 'pick_up_filter';

  CollectionReference get _filterCollectionRef =>
      _firestoreInstance.collection(_filterCollection);

  @override
  Future<SpecialistFilterDto> getSpecialistFilter() async {
    final filterSnapshot = await _filterCollectionRef.doc(_filterId).get();

    final filterData = filterSnapshot.data() as Map<String, dynamic>?;
    if (filterData == null) return SpecialistFilterDto.empty;

    return SpecialistFilterDto.fromJson(filterData);
  }

  @override
  Future<PickUpFilterDto> getPickUpFilter() async {
    final pickUpSnapshot = await _filterCollectionRef.doc(_pickUpId).get();

    final pickUpFilterData = pickUpSnapshot.data() as Map<String, dynamic>?;
    if (pickUpFilterData == null) return PickUpFilterDto.empty;

    return PickUpFilterDto.fromJson(pickUpFilterData);
  }
}
