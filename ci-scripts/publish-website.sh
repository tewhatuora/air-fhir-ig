#!/bin/sh -x
API_BASE_URL="$CI_API_V4_URL/projects/$CI_PROJECT_ID/packages/generic/"
TOC_FILE="public/versions.html"
INDEX_FILE="public/index.html"
MANIFEST=ci-scripts/website-manifest.yaml

# download the website-doc files from the gitlab repo, based on the layout in $MANIFEST
# also generate a very basic index.html file
# unzip into public
# in gitlab CI the public folder becomes the website

mkdir -p public zipfiles

cat << EOF > $INDEX_FILE
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />

  <!-- Instant meta redirect fallback -->
  <meta http-equiv="refresh" content="0; url=api_v2/index.html" />

  <title>Redirecting...</title>

  <!-- JavaScript redirect (more reliable in modern browsers) -->
  <script>
    window.location.replace("api_v2/index.html");
  </script>

  <noscript>
    <!-- Fallback if JavaScript is disabled -->
    <meta http-equiv="refresh" content="0; url=api_v2/index.html" />
  </noscript>
</head>

<body>
  <p>
    Redirecting… If nothing happens,
    <a href="api_v2/index.html">click here</a>.
  </p>
</body>
</html>
EOF

echo "<h1>index</h1>" > $TOC_FILE
echo "<ul>" >> $TOC_FILE

echo "Reading $MANIFEST..."
for key in $(yq eval '.. | select(tag != "!!map" and tag != "!!seq") | path | join(".") as $p | "\( $p )"' $MANIFEST); do
    artifact_name=$(yq e ".$key" $MANIFEST)
    aFileName=${artifact_name/\//_}
    echo "-${aFileName}-"

    if [ ! -f "zipfiles/$aFileName.zip" ]; then
        echo "Downloading artifact '${API_BASE_URL}${artifact_name}/web-pages.zip' to zipfiles/${aFileName}.zip"

        curl --header "JOB-TOKEN: $CI_JOB_TOKEN" \
                "${API_BASE_URL}${artifact_name}/web-pages.zip" \
                -o "zipfiles/$aFileName.zip"

    else
        echo "zipfiles/$aFileName.zip already exists, skipping download."
    fi

    KEY_FNAME=${key//./\/}

    # Unzip into subfolder
    mkdir -p "$KEY_FNAME"
    unzip -q "zipfiles/$aFileName.zip" -d "$KEY_FNAME"

    # add to index
    SHORT_FNAME=${KEY_FNAME#public/}
    echo "  <li><a href=\"$SHORT_FNAME/index.html\">$SHORT_FNAME</a></li>" >> $TOC_FILE
done

echo "</ul>" >> $TOC_FILE

mv public ..
