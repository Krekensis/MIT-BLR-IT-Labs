# Shell script: Calculate Gross Salary (Floating point)

echo "Enter Basic salary:"
read basic

echo "Enter TA:"
read ta

gs=$(echo "$basic + $ta + ($basic * 0.10)" | bc -l)
echo "Gross Salary = $gs"