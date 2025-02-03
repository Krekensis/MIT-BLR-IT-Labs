/*
2d. Write a Java program to display non principle diagonal elements and find their sum.
[Hint: Non Principal diagonal: The diagonal of a diagonal matrix from the top right to the bottom left corner is called non principal diagonal.]
*/

package Lab_2_Control_statements;

public class Q4_nonDiagElems {
    public static void main(String[] args) {
        int[][] matrix = { 
            { 1, 2, 3 }, 
            { 4, 5, 6 }, 
            { 7, 8, 9 } 
        };

        int sum = 0;
        System.out.println("Non diagonal principle elements are: ");
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++) {
                if (i + j == matrix.length - 1) {
                    System.out.print(matrix[i][j] + " ");
                    sum += matrix[i][j];
                }   
            }
        }
        System.out.println("\nSum of non principal diagonal elements: " + sum);
    }   
}
