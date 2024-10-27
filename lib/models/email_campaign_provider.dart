import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarel_info_machine/models/database_model.dart';
import 'package:scarel_info_machine/models/databse_helper.dart';

class EmailCampaignNotifier extends StateNotifier<List<EmailCampaignData>> {
  final DatabaseHelper _databaseHelper;

  EmailCampaignNotifier(this._databaseHelper) : super([]);

  Future<void> addCampaign(EmailCampaignData campaign) async {
    try {
      final id = await _databaseHelper.insertCampaign(campaign);
  
      state = [...state, campaign.copyWith(id: id)];
    } catch (error) {
      throw Exception("Failed to add campaign: $error");
    }
  }

  Future<void> fetchCampaigns() async {
    try {
      final campaigns = await _databaseHelper.getCampaignDetails();
      state = campaigns; 
      print(campaigns);
    } catch (error) {
      throw Exception("Failed to fetch campaigns: $error");
    }
  }
}

final emailCampaignProvider = StateNotifierProvider<EmailCampaignNotifier, List<EmailCampaignData>>((ref) {
  final databaseHelper = DatabaseHelper();
  return EmailCampaignNotifier(databaseHelper);
});
