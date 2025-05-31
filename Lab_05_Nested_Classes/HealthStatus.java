/* Java program with class HealtMonitor with static nested class healthSatus which has instance variables blood pressure and  heart rate. method is health monitor should display health is good bad or avg based on values in health status. Must have array of patients of health monitor*/

package Lab_05_Nested_Classes;

import java.util.*;

class HealthMonitor {
    String name, status;
    HealthStatus healthStatus;

    public HealthMonitor(String name, int bloodPressure, int heartRate) {
        this.name = name;
        this.healthStatus = new HealthStatus(bloodPressure, heartRate);
    }

    public void display() {
        compute();
        System.out.println(
            "Patient Name: " + name + 
            "\nBlood Pressure: " + healthStatus.bloodPressure + 
            "\nHeart Rate: " + healthStatus.heartRate + 
            "\nHealth Status: " + status
        );
    }

    public void compute() {
        if (healthStatus.bloodPressure < 120 && healthStatus.heartRate < 80) {
            status = "Good";
        } else if (healthStatus.bloodPressure >= 120 && healthStatus.bloodPressure <= 139
                && healthStatus.heartRate >= 80 && healthStatus.heartRate <= 89) {
            status = "Average";
        } else {
            status = "Bad";
        }
    }

    static class HealthStatus {
        int bloodPressure;
        int heartRate;

        public HealthStatus(int bloodPressure, int heartRate) {
            this.bloodPressure = bloodPressure;
            this.heartRate = heartRate;
        }
    }
}

public class HealthStatus {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of patients: ");
        int n = sc.nextInt();

        HealthMonitor patients[] = new HealthMonitor[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Enter patient name: ");
            sc.nextLine();
            String name = sc.nextLine();
            System.out.print("Enter blood pressure: ");
            int bp = sc.nextInt();
            System.out.print("Enter heart rate: ");
            int hr = sc.nextInt();

            patients[i] = new HealthMonitor(name, bp, hr);
        }

        for (int i = 0; i < n; i++) {
            System.out.println("\nPatient " + (i + 1));
            patients[i].display();
        }

        sc.close();
    }
}