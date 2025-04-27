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

echo "All done! Broken image references have been removed." 