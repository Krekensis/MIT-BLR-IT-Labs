// Accept the number of days a member is late to return the book. Calculate and display the fine with the appropriate message using if-else ladder. The fine is charged as per the table below:
/* 
-----------------------------
| Late period     Fine      |
| 5 days          Rs. 0.50  |
| 6 - 10 days     Rs. 1.00  |
| Above 10 days   Rs. 5.00  |
| After 30 days   Rs. 10.00 |
-----------------------------
*/

#include <stdio.h>

int main() {
    int daysLate;
    float fine;

    printf("Enter the number of days late: ");
    scanf("%d", &daysLate);

    if (daysLate <= 5) {
        fine = 0.50;
    } else if (daysLate <= 10) {
        fine = 1.00;
    } else if (daysLate <= 30) {
        fine = 5.00;
    } else {
        fine = 10.00;
    }

    printf("The fine for being %d days late is Rs. %.2f\n", daysLate, fine*daysLate);

    return 0;
}
