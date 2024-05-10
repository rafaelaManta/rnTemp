#!/bin/bash


command_exists() {
    command -v "$1" &> /dev/null
}

#create_version_file (){
#  print_message 'create android version'
#  app_dir="$project_dir/android/app"
#  file_name="version.properties"
#  src_dir='.'
#
#  if [ ! -e "$app_dir/$file_name" ]; then
#    cp "$src_dir/$file_name" "$app_dir/$file_name"
#    print_message "File '$file_name' created."
#  fi
#}
#
#create_android_output_folder(){
#folder_name="output"
#print_message 'create output build folder'
#
#if [ ! -d "$project_dir/$folder_name" ]
#then
#    mkdir "$project_dir/$folder_name"
#    print_message "Folder '$folder_name' created."
#fi
#}

print_message() {
  local message="$1"
  echo "************************************************************"
  echo "$message"
  echo "************************************************************"
}
