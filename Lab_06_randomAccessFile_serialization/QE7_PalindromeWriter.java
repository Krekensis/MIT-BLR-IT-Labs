/* 7.  Write a java program to write all palindrome into a new file. */

import java.io.*;

public class QE7_PalindromeWriter {
    public static void main(String[] args) throws IOException {
        RandomAccessFile raf = new RandomAccessFile("./data/words.txt", "r");
        BufferedWriter bw = new BufferedWriter(new FileWriter("./fileout/palindromes.txt"));
        String word;
        while ((word = raf.readLine()) != null) {
            if (isPalindrome(word)) {
                bw.write(word);
                bw.newLine();
            }
        }
        raf.close();
        bw.close();
    }
    static boolean isPalindrome(String s) {
        return s.equalsIgnoreCase(new StringBuilder(s).reverse().toString());
    }
}
