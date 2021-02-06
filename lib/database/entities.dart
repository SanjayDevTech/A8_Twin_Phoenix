import 'package:floor/floor.dart';

@entity
class Bio {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final Personal personal;
  final List<Education> educations;
  final List<Experience> experiences;
  final List<Skill> skills;
  final List<String> interests;
  final List<String> achievements;
  final List<Link> links;
  Bio(this.id, this.personal, this.educations, this.experiences, this.skills,
      this.interests, this.achievements, this.links);

  // Bio.fromJson(Map<String, dynamic> json): id = json['id'], personal = Personal.fromJson(jsonDecode(json['personal'])), educations = List.from(jsonDecode(json['']))
}

class Skill {
  final String skillName;
  final int level;
  Skill(this.skillName, this.level);
  Skill.fromJson(Map<String, dynamic> json)
      : skillName = json['name'],
        level = json['level'];

  Map<String, dynamic> toJson() => {
        'skillName': skillName,
        'level': level,
      };
}

class Personal {
  final String name, email, addr, phno;
  Personal(this.name, this.email, this.addr, this.phno);

  Personal.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        addr = json['addr'],
        phno = json['phno'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'addr': addr,
        'phno': phno,
      };
}

class Link {
  final String name, link;
  Link(this.name, this.link);

  Link.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link = json['link'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'link': link,
      };
}

class Experience {
  final String companyName, jobTitle, startDate, endDate, details;
  Experience(this.companyName, this.jobTitle, this.startDate, this.endDate,
      this.details);

  Experience.fromJson(Map<String, dynamic> json)
      : companyName = json['companyName'],
        jobTitle = json['jobTitle'],
        startDate = json['startDate'],
        endDate = json['endDate'],
        details = json['details'];

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'jobTitle': jobTitle,
        'startDate': startDate,
        'endDate': endDate,
        'details': details,
      };
}

class Education {
  final String course, school, grade, year;
  Education(this.course, this.school, this.grade, this.year);

  Education.fromJson(Map<String, dynamic> json)
      : course = json['course'],
        school = json['school'],
        grade = json['grade'],
        year = json['year'];

  Map<String, dynamic> toJson() => {
        'course': course,
        'school': school,
        'grade': grade,
        'year': year,
      };
}
