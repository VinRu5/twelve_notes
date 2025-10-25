import '../dto/profile_dto.dart';

class ProfileService {
  // final SupabaseClient _supabase;

  // ProfileService({
  //   required SupabaseClient supabase,
  // }) : _supabase = supabase;
  ProfileService();

  static const String _profileTable = 'profiles';

  Future<void> createProfile(ProfileDTO profileDTO) async {
    try {
      // await _supabase.from(_profileTable).insert(profileDTO.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
