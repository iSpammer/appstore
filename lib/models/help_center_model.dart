import 'dart:convert';

class HelpCenter {
  String title = '';
  String clickThrough = '';
  String icon = '';

  HelpCenter({required this.title, required this.clickThrough, required this.icon});

  factory HelpCenter.fromJson(Map<String, dynamic> json) {
    return HelpCenter(
        title: json['title'] ?? '',
        clickThrough: json['clickthrough'] ?? '',
        icon: json['iconpath'] ?? ''
    );
  }
}

class HelpCentersModel {
  List<HelpCenter> helpCenters = [];

  HelpCentersModel.empty() {
    helpCenters = [];
  }

  HelpCentersModel({required this.helpCenters});
  
  factory HelpCentersModel.fromJson(Map<String, dynamic> jsonMap) {
    
    List<HelpCenter> _getHelpCenter(String jsonString) {
      return List<HelpCenter>.from(json.decode(jsonString).map( (item) {
        return HelpCenter.fromJson(item);
      }));
    }
    return HelpCentersModel(helpCenters: _getHelpCenter(jsonMap['help_center'].toString()));
  }
}