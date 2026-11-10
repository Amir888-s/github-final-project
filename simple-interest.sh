#!/usr/bin/env bash
# Simple Interest Calculator
# Author: Amir Kabdilmalik (Amir888-s)
# Inputs: principal, annual interest rate (percentage), time (years).
# Formula: simple interest = principal * rate * time / 100.

set -euo pipefail
export LC_ALL=C

read_number() {
  local prompt="$1" value
  printf '%s\n' "$prompt" >&2
  if ! IFS= read -r value; then
    printf 'Error: missing input.\n' >&2
    return 1
  fi
  if [[ ! "$value" =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]]; then
    printf 'Error: enter a nonnegative number.\n' >&2
    return 1
  fi
  printf '%s' "$value"
}

principal=$(read_number 'Enter the principal:')
rate=$(read_number 'Enter rate of interest per year (%):')
time=$(read_number 'Enter time period in years:')

awk -v p="$principal" -v r="$rate" -v t="$time" \
  'BEGIN { printf "The simple interest is: %.2f\n", p * r * t / 100 }'
