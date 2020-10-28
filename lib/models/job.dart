import 'package:curso_job_finder_app/models/company.dart';

class Job {
  String location;
  String role;
  Company company;
  bool isFavorites;

  Job({this.role, this.location, this.company, this.isFavorites = false});

}
