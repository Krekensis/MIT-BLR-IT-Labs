/* 6.  consider a file student.txt which contains the following info:
    ( regno : name : mark ) where the fields are separated by : 
    Write a java program to display the student who scored the highest marks.
*/

import java.io.*;

public class QE6_HighestMark {
    public static void main(String[] args) throws IOException {
        RandomAccessFile raf = new RandomAccessFile("./data/student.txt", "r");
        String line, topStudent = "";
        int max = -1;
        while ((line = raf.readLine()) != null) {
            String[] parts = line.split(":");
            int mark = Integer.parseInt(parts[2]);
            if (mark > max) {
                max = mark;
                topStudent = parts[1];
            }
        }
        raf.close();
        System.out.println("Topper is " + topStudent + " with marks: " + max);
    }
}
