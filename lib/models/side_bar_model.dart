class StepModel {
  final String title;
  final String description;
  final bool isActive;

  StepModel({required this.title, required this.description, this.isActive = false});
}
  final List<StepModel> steps = [
    StepModel(title: "Create New Campaign", description: 'Fill out these details and get your campaign ready', isActive: true),
    StepModel(title: "Create Segments",description: 'Get full control over your audience'),
    StepModel(title: "Bidding strategy",description: 'Optimize your campaign reach with adsense'),
    StepModel(title: "Site Links",description: 'Setup your customer journey flow'),
    StepModel(title: "Review Campaign",description: 'Double check your campaign is ready to go!'),
  ];