/* 4.  Consider a directory MIT/ICT which contains java files, out of which one file is the replica of another file. Write a java program to find those 2 files.  */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class QE4_DuplicateFiles {

    public static void main(String[] args) throws IOException {
        File dir = new File("MIT/ICT");
        File[] files = dir.listFiles((d, name) -> name.endsWith(".java"));

        if (files == null || files.length < 2) {
            System.out.println("Not enough files to compare.");
            return;
        }

        int flag = 0;
        for (int i = 0; i < files.length; i++) {
            for (int j = i + 1; j < files.length; j++) {
                Path p1 = files[i].toPath();
                Path p2 = files[j].toPath();

                long result = Files.mismatch(p1, p2);

                if (result == -1) {
                    flag = 1;
                    System.out.println("Duplicate found: " + files[i].getName() + " and " + files[j].getName());
                }
            }
        }
        if (flag == 0) {
            System.err.println("No duplicate files");
        }
    }
}
