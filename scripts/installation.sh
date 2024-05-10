#!/bin/bash

source utils.sh
source setup.sh

print_message "Welcome to rnTemp!"

# Check if npm, yarn, or bun is installed
if command_exists npm; then
    package_manager="npm"
elif command_exists yarn; then
    package_manager="yarn"
elif command_exists bun; then
    package_manager="bun"
else
    print_message "Error: Neither npm, yarn, nor bun is installed. Please install either npm, yarn, or bun."
    exit 1
fi

read -p "Enter version: " version
read -p "Enter project name: " project_name
read -p "Enter directory (leave blank for current directory): " install_dir


if [ -z "$install_dir" ]; then
    install_dir=$(pwd)
fi

print_message "Creating React Native project..."
absolute_install_dir="$HOME/$install_dir"
npx react-native init "$project_name" --version "$version" --directory "$absolute_install_dir/$project_name"

cd "$absolute_install_dir/$project_name" || exit

print_message "Installing dependencies using $package_manager..."

if [ "$package_manager" = "npm" ]; then
    npm install --save \
        @react-navigation/bottom-tabs \
        @react-navigation/drawer \
        @react-navigation/native \
        @react-navigation/native-stack \
        @react-navigation/stack \
        @tanstack/react-query \
        axios \
        react-native-device-info \
        react-native-gesture-handler \
        react-native-reanimated \
        react-native-safe-area-context \
        react-native-screens
elif [ "$package_manager" = "yarn" ]; then
    yarn add \
        @react-navigation/bottom-tabs \
        @react-navigation/drawer \
        @react-navigation/native \
        @react-navigation/native-stack \
        @react-navigation/stack \
        @tanstack/react-query \
        axios \
        react-native-device-info \
        react-native-gesture-handler \
        react-native-reanimated \
        react-native-safe-area-context \
        react-native-screens
elif [ "$package_manager" = "bun" ]; then
    bun install \
        @react-navigation/bottom-tabs \
        @react-navigation/drawer \
        @react-navigation/native \
        @react-navigation/native-stack \
        @react-navigation/stack \
        @tanstack/react-query \
        axios \
        react-native-device-info \
        react-native-gesture-handler \
        react-native-reanimated \
        react-native-safe-area-context \
        react-native-screens
fi

print_message "Dependencies installed successfully."
./setup.sh "$absolute_install_dir/$project_name"



