String vowels = "aeiou";
String punctuation = ",.";

public void setup() {
    String[] lines = loadStrings("LowellHymn.txt");
    for (String line : lines) {
        String[] words = line.split(" ");
        for (String word : words) {
            String latin;
            if (word.length() > 1 && punctuation.contains(word.substring(word.length() - 1))) {
                latin = pigLatin(word.substring(0, word.length() - 1)) + word.substring(word.length() - 1);
            } else {
                latin = pigLatin(word);
            }
            System.out.print(latin);
            System.out.print(" ");
        }
        System.out.println();
    }
}

public int findFirstVowel(String s_word) {
    for (int i = 0; i < s_word.length(); i++) {
        String character = s_word.substring(i, i + 1);
        if ((i + 1) < s_word.length() && character.equals("q") && s_word.substring(i + 1, i + 2).equals("u")) {
            i++;
        }
        if (vowels.contains(character.toLowerCase())) {
            return i;
        }
    }
    return s_word.length();
}

public String pigLatin(String s_word) {
    int vowel_idx = findFirstVowel(s_word);
    if (vowel_idx > 0) {
        return s_word.substring(vowel_idx) + s_word.substring(0, vowel_idx) + "ay";
    }
    return s_word + "way";
}
