
class LogInWithEmailAndPaswordFailure{
  final String message;

  const LogInWithEmailAndPaswordFailure([this.message = "An unknown Error occured"]);
  factory LogInWithEmailAndPaswordFailure.code(String code){
    switch (code){
      case 'user-not-found': return LogInWithEmailAndPaswordFailure('No user found for that email.');
      case 'wrong-password': return LogInWithEmailAndPaswordFailure('Wrong password provided for this user.');
      case 'user-disabled':return LogInWithEmailAndPaswordFailure('This user has been disabled. Please contact support for help');
      default: return LogInWithEmailAndPaswordFailure();
    }
  }
}