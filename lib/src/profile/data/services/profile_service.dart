import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twelve_notes/src/profile/data/dto/profile_dto.dart';

class ProfileService {
  final SupabaseClient _supabase;

  ProfileService({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  static const String _profileTable = 'profiles';

  Future<void> createProfile(ProfileDTO profileDTO) async {
    try {
      await _supabase.from(_profileTable).insert(profileDTO.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
