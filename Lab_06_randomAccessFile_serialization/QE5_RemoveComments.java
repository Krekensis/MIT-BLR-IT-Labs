/*5.  Write a java program to remove the comments from the file. */

import java.io.*;

public class QE5_RemoveComments {
    public static void main(String[] args) throws IOException {

        String inloc = "./data/QE5.java";
        String outloc = "./fileout/QE5.java";
        RandomAccessFile raf = new RandomAccessFile(inloc, "r");
        BufferedWriter bw = new BufferedWriter(new FileWriter(outloc));
        String line;
        while ((line = raf.readLine()) != null) {
            line = line.replaceAll("//.*", ""); // remove single-line comments
            line = line.replaceAll("/\\*.*?\\*/", ""); // remove block comments
            bw.write(line);
            bw.newLine();
        }
        raf.close();
        bw.close();
        System.err.println("Removed comments and saved to: " + outloc );
    }
}
