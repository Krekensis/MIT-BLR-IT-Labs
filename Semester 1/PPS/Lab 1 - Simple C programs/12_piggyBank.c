// Determine how much money (in rupees) is in a piggy bank that contains denominations of 20, 10 and 5 rupees along with 50 paisa coins. Use the following values to test the program: 13 twenty rupee notes, 11 ten rupee notes, 7 five rupee coins and 13 fifty paisa coins.
// [Hint: 13 * 20 + 11 * 10 + 7 *5 + 0.50 *13 = Rs.411.50].

#include <stdio.h>

int main() {
    int Rs20, Rs10, Rs5, P50;
    float total;

    printf("Enter the number of 20 rupee notes: ");
    scanf("%d", &Rs20);

    printf("Enter the number of 10 rupee notes: ");
    scanf("%d", &Rs10);

    printf("Enter the number of 5 rupee coins: ");
    scanf("%d", &Rs5);

    printf("Enter the number of 50 paisa coins: ");
    scanf("%d", &P50);

    total = (Rs20 * 20) + (Rs10 * 10) + (Rs5 * 5) + (P50 * 0.50);

    printf("Total amount in the piggy bank: Rs. %.2f\n", total);

    return 0;
}
