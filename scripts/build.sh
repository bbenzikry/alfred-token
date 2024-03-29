#!/bin/bash
set -e

# this script's parent directory
cd $(dirname $(dirname $0))
PARENT_DIR=$(pwd)
[ -d ./output ] && rm -rf ./output
mkdir output
cd output
cp -f ${PARENT_DIR}/src/info.plist.xml ./info.plist
cp -f ${PARENT_DIR}/src/utils.zsh ./utils.zsh
cp -f ${PARENT_DIR}/src/search.zsh ./search.zsh
cp -f ${PARENT_DIR}/src/open.zsh ./open.zsh

echo "Updating version ..."
curVersion=${WORKFLOW_VERSION:-"v1.0.2"}
sed -i '' 's/{{version}}/'${curVersion}'/' info.plist

echo "Add README ..."
readme="${PARENT_DIR}/src/README.md"
sed -i '' -e "/{{readme}}/{r ${readme}" -e 'd' -e '}' info.plist

echo "Add db ..."
cp -f ${PARENT_DIR}/tokens.json ./tokens.json
cp -f ${PARENT_DIR}/chains.json ./chains.json

echo "Add icons ..." 
[ -d ./icons ] && rm -rf ./icons
cp -R -f ${PARENT_DIR}/icons ./icons

# Note: this is done ahead of time
# echo "Optimizing icons ..."
# /bin/ls "./icons" | grep ".png" | xargs -I{} pngquant ./icons/{} --output ./icons/{} -f &> /dev/null

echo "Add res ... "
cp -f ${PARENT_DIR}/res/* .

# Note: will be done via package manager instead
# echo "Injecting auto-update script ..."
# update="$(mktemp)"
# cat ${PARENT_DIR}/src/update.sh | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g' > ${update}
# sed -i '' -e "/{{update_script}}/{r ${update}" -e 'd' -e '}' info.plist

echo "Bundling workflow ..."
zip -Z deflate -rq9 ${PARENT_DIR}/alfred-token.alfredworkflow * -x etc