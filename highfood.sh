#!/bin/bash

# Define the environment (dev, uat, prod) - pass this as a parameter
ENVIRONMENT=$1

# Check if the Trivy report file exists
if [[ ! -f "trivy-report.txt" ]]; then
    echo "Trivy report file 'trivy-report.txt' not found!"
    exit 1
fi

# Extract the actual high vulnerabilities, ignoring the summary lines
high_vulns=$(grep -i "HIGH" trivy-report.txt | grep -v "Total:")

# Check if any high vulnerabilities were found
if [[ -n "$high_vulns" ]]; then
    echo "HIGH severity detected with the following vulnerability IDs:"
    echo "$high_vulns"
    echo "High vulnerabilities found, aborting deployment."
    exit 1
else
    # If no high vulnerabilities, proceed with deployment based on environment
    if [[ "$ENVIRONMENT" == "dev" ]]; then
        echo "Deploying to DEV environment..."
        # Add your Dev deployment steps here
        # Example: ./deploy_to_dev.sh
    elif [[ "$ENVIRONMENT" == "uat" ]]; then
        echo "Deploying to UAT environment..."
        # Add your UAT deployment steps here
        # Example: ./deploy_to_uat.sh
    elif [[ "$ENVIRONMENT" == "prod" ]]; then
        echo "Deploying to PROD environment..."
        # Add your Prod deployment steps here
        # Example: ./deploy_to_prod.sh
    else
        echo "Invalid environment selected! Please choose dev, uat, or prod."
        exit 1
    fi
fi

