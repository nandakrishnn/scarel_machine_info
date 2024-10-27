class EmailCampaign{
  final int id;
  final String subject;
  final String previewtext;
  final String fromName;
  final String fromEmail;
 
  EmailCampaign({
    required this.id,
    required this.subject,
    required this.previewtext,
    required this.fromName,
    required this.fromEmail, 
  });
}