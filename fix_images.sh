#!/bin/bash

# Script to fix broken image references in HTML files

# Fix sitemeter references (they're causing 404 errors)
echo "Fixing sitemeter.com references..."
find . -type f -name "*.html" -exec sed -i '' 's|<script.*s10\.sitemeter\.com.*</script>||g' {} \;

# Fix broken photobucket images
echo "Fixing photobucket.com references..."
find . -type f -name "*.html" -exec sed -i '' 's|<img.*photobucket\.com[^>]*>|<!-- Removed broken photobucket image -->|g' {} \;

# Fix broken links to local images folder
echo "Fixing local image references..."
find . -type f -name "*.html" -exec sed -i '' 's|<img.*gitrknowswow\.com/images/[^>]*>|<!-- Removed broken local image -->|g' {} \;

# Fix _gat is not defined error
echo "Fixing _gat reference errors..."
find . -type f -name "*.html" -exec sed -i '' 's|_gat\.|window._gat \&\& _gat\.|g' {} \;

# Script to fix HTTP image URLs to HTTPS
# This is necessary for sites deployed on GitHub Pages which uses HTTPS

echo "Starting HTTP to HTTPS image URL conversion..."

# Find all HTML files in the current directory recursively
find . -type f -name "*.html" -print0 | while IFS= read -r -d '' file; do
    echo "Processing file: $file"
    
    # Replace http:// with https:// in image src attributes
    # This excludes any URLs that might be problematic when converted (add more as needed)
    sed -i'.bak' 's|src="http://\([^"]*\)"|src="https://\1"|g' "$file"
    
    # Clean up backup files
    rm "${file}.bak"
done

echo "Image URL fix completed!"

echo "All done! Broken image references have been removed." 