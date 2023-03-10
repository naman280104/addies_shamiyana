
class SignUpWithEmailAndPaswordFailure{
  final String message;

  const SignUpWithEmailAndPaswordFailure([this.message = "An unknown Error occured"]);
  factory SignUpWithEmailAndPaswordFailure.code(String code){
    switch (code){
      case 'weak-password': return SignUpWithEmailAndPaswordFailure('Please enter a stronger password.');
      case 'invalid-email': return SignUpWithEmailAndPaswordFailure('Email is not valid for badly formatted');
      case 'email-already-in-use':return SignUpWithEmailAndPaswordFailure('An account already exists for that email');
      case 'operation-not-allowed':return SignUpWithEmailAndPaswordFailure('Operartion is not allowed. Please Contact Support');
      case 'user-disabled':return SignUpWithEmailAndPaswordFailure('This user has been disabled. Please contact support for help');
      default: return SignUpWithEmailAndPaswordFailure();
    }
  }
}