#!/bin/bash


search_string="PRODUCT_PACKAGES += Trebuchet"
replacement_string="PRODUCT_PACKAGES += QuineLauncher"
android_mk_files=$(find . -type f -name "Android.mk")

for file in $android_mk_files; do
  if grep -q "$search_string" "$file"; then
    sed -i "s/$search_string/$replacement_string/g" "$file"
    echo "Replaced in $file"
  fi
done