

class Greetings{

  String timeGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    else if (hour>=12 && hour < 17) {
      return 'Afternoon';
    }
    else if (hour>=17 && hour < 20) {
      return 'Evening';
    }
    return 'Evening';
  }

}