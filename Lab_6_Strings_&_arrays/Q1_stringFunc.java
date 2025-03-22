/*
6a. Write a menu driven program to do the following
i. To check whether a string is palindrome or not
ii. Write the string in an alphabetical order
iii. Reverse the string
iv. Concatenate the original string and the reversed string
 */

import java.util.Scanner;

public class Q1_stringFunc {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a string: ");
        String str = sc.nextLine();
        sc.close();

        System.out.println("1. Check if palindrome" +
                "\n2. Write in alphabetical order" +
                "\n3. Reverse the string" +
                "\n4. Concatenate original and reversed string" +
                "\nEnter your choice:");

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
                System.out.println("The string in alphabetical order is: " + sortString(str));
                break;
            case 3:
                System.out.println("The reversed string is: " + reverseString(str));
                break;
            case 4:
                System.out.println("The concatenated string is: " + concatenateString(str));
                break;
            default:
                System.out.println("Invalid choice");
        }
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

    public static String sortString(String str) {
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
        return new String(arr);
    }

    public static String reverseString(String str) {
        char[] arr = str.toCharArray();
        for (int i = 0; i < arr.length / 2; i++) {
            char temp = arr[i];
            arr[i] = arr[arr.length - i - 1];
            arr[arr.length - i - 1] = temp;
        }
        return new String(arr);
    }

    public static String concatenateString(String str) {
        return str + reverseString(str);
    }
}

