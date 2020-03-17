class Stack {
  String name;
  String backend;
  String frontend;
  String database;
  String server;

  Stack(this.name, this.backend, this.frontend, this.database, this.server);
}

class TechLearners {
  List stacks = [];
  List mentors = [];

  void addStacks(String name, String backend, String frontend, String database,
      String server) {
    Stack s = new Stack(name, backend, frontend, database, server);
    stacks.add(s);
  }

  void setMentorOrLearner(User user, UserRole role) {
    user.setRole(role);

    if (role == UserRole.Mentor) {
      mentors.add(user);
    }
  }

  String getMentor(String stackName, String time) {
    var mentorAvailable = false;
    User mentor;

    for (var i = 0; i < mentors.length; i++) {
      print(mentors[i].stackName);
      if (stackName == mentors[i].stackName &&
          time == mentors[i].availableTime) {
        mentorAvailable = true;
        mentor = mentors[i];
      }
    }

    if (mentorAvailable) {
      return 'Available mentor name is ${mentor.name}';
    } else {
      return 'No mentor available';
    }
  }

  setAvailableTime(User u, String hhmm) {
    if (u.role == UserRole.Mentor) {
      u.setTime(hhmm);
    }
  }
}

enum UserRole { Mentor, Learner }

class User {
  String name;
  UserRole role;
  String availableTime;
  String stackName;

  User(this.name);

  setRole(UserRole role) {
    this.role = role;
  }

  setTime(String hhmm) {
    this.availableTime = hhmm;
  }

  setStack(String stackName) {
    this.stackName = stackName;
  }
}

void main() {
  TechLearners t1 = new TechLearners();
  t1.addStacks("Stack1", "Node", "React", "MongoDB", "Express");
  t1.addStacks("Stack2", "Apache", "React", "MySQL", "PHP");

  User u1 = new User("user1");
  t1.setMentorOrLearner(u1, UserRole.Mentor);

  t1.setAvailableTime(u1, "1500");
  u1.setStack("Stack1");

  String msg = t1.getMentor("Stack1", "1500");
  print(msg);
}
