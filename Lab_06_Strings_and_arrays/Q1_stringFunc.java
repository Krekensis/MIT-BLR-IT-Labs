/*
6a. Write a menu driven program to do the following
i. To check whether a string is palindrome or not
ii. Write the string in an alphabetical order
iii. Reverse the string
iv. Concatenate the original string and the reversed string
 */

package Lab_06_Strings_and_arrays;
import java.util.Scanner;

public class Q1_stringFunc {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a string: ");
        String str = sc.nextLine();

        System.out.print("1. Check if palindrome" +
                "\n2. Write in alphabetical order" +
                "\n3. Reverse the string" +
                "\n4. Concatenate original and reversed string" +
                "\nEnter your choice: ");

        int choice = sc.nextInt();

        switch (choice) {
            case 1:
                if (isPalindrome(str)) {
                    System.out.println("The string is a palindrome");
                } else {
                    System.out.println("The string is not a palindrome");
                }
                break;
            case 2:
                System.out.println("The string in alphabetical order is: " + sort(str));
                break;
            case 3:
                System.out.println("The reversed string is: " + reverse(str));
                break;
            case 4:
                System.out.println("The concatenated string is: " + concat(str));
                break;
            default:
                System.out.println("Invalid choice");
        }
        sc.close();
    }

    public static boolean isPalindrome(String str) {
        int i = 0, j = str.length() - 1;
        while (i < j) {
            if (str.charAt(i) != str.charAt(j)) {
                return false;
            }
            i++; j--;
        }
        return true;
    }

    public static String sort(String str) {
        char[] arr = str.toCharArray();
        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] > arr[j]) {
                    char temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
        return (new String(arr)).strip();
    }

    public static String reverse(String str) {
        /*
        String rev = "";
        for (int i = str.length() - 1; i >= 0; i--) {
            rev += str.charAt(i);
        
        return new rev;
        */
        return new StringBuilder(str).reverse().toString();
    }

    public static String concat(String str) {
        return str + reverse(str);
    }
}

