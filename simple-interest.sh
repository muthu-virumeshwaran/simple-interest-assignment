#!/usr/bin/env bash
# simple-interest.sh
# Usage: ./simple-interest.sh principal rate_annual time_years
# Example: ./simple-interest.sh 1000 5 2

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <principal> <rate_annual_percent> <time_years>"
  exit 1
fi

P="$1"
R="$2"
T="$3"

# Validate numbers (basic)
re='^-?[0-9]*\.?[0-9]+$'
if ! [[ $P =~ $re && $R =~ $re && $T =~ $re ]]; then
  echo "All arguments must be numeric."
  exit 2
fi

# Simple interest formula: SI = (P * R * T) / 100
SI=$(awk -v p="$P" -v r="$R" -v t="$T" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
TOTAL=$(awk -v p="$P" -v si="$SI" 'BEGIN { printf "%.2f", p + si }')

echo "Principal: $P"
echo "Rate (annual %): $R"
echo "Time (years): $T"
echo "Simple Interest: $SI"
echo "Total Amount: $TOTAL"
