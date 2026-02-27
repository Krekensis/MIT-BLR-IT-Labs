/*3.  Write a java program to find the occurence of word in a given file*/

import java.io.*;

public class QE3_WordOccurrence {
    public static void main(String[] args) throws IOException {
        RandomAccessFile raf = new RandomAccessFile("./data/QE3.txt", "r");
        String word = "java";
        int count = 0;
        String line;
        while ((line = raf.readLine()) != null) {
            for (String w : line.split("\\s+")) {
                if (w.equalsIgnoreCase(word)) count++;
            }
        }
        raf.close();
        System.out.println("Occurrence of '" + word + "': " + count);
    }
}
