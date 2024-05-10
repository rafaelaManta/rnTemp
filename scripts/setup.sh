#!/bin/sh

source utils.sh
project_dir=$1

print_message "Setup beginning..."
#cp ""

echo "Choose an environment:"
echo "1. dev"
echo "2. preview"
echo "3. live"
read -p "Enter the number corresponding to your choice: " environment_choice

# Validate the environment choice
case $environment_choice in
    1)
        environment="dev"
        ;;
    2)
        environment="preview"
        ;;
    3)
        environment="live"
        ;;
    *)
        print_message "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Choose a platform:"
echo "1. android"
echo "2. iOS"
read -p "Enter the number corresponding to your choice: " platform_choice

case $platform_choice in
    1)
        platform="android"
        ;;
    2)
        platform="iOS"
        ;;
    *)
        print_message "Invalid choice. Exiting."
        exit 1
        ;;
esac

print_message "You have chosen the $environment environment and the $platform platform."



cp "$project_dir/src/envs/env.$environment.js" "$project_dir/src/env.js"





