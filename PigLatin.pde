String vowels = "aeiou";
String consonants = "(?:qu)|[bcdfghjklmnpqrstvwxyz]";

public void setup() {
    String[] lines = loadStrings("words.txt");
    println(consonants);
    for (String line : lines) {
        String[] words = line.split(" ");
        for (String word : words) {
            System.out.println(word + ": " + pigLatin(word));
        }
    }
}

public String pigLatin(String s_word) {
    String[] m = match(s_word, "^(" + consonants + ")+");
    if (m != null) {
        String leading_consonants = m[0];
        return s_word.substring(leading_consonants.length()) + leading_consonants + "ay";
    }
    return s_word + "way";
}
