String toTitleCase(String s){
  String res = '';
  List<String> exceptions = ['(', ')', ' '];
  for(int i=0; i<s.length; i++){
    if (i==0){
      res += s[i].toUpperCase();
    }
    else if ((s[i] == s[i].toUpperCase() && !exceptions.contains(s[i]))
    && (s[i-1] == s[i-1].toLowerCase() && !exceptions.contains(s[i-1]))) {
        res += ' ${s[i]}';
      }
    else {
      res += s[i];
    }
  }

  return res;
}
