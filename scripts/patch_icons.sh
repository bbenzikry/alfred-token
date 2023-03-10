#!/usr/bin/env bash
jq -c . "./tokens.json" | while read -r jsonline ; do
      ICON_HASH=$(jq -s -j '.[] | [.iconHash] | @tsv' <<<$jsonline)
      ICON_FILE_NAME="./icons/$ICON_HASH.png"
      if [ -f $ICON_FILE_NAME ]; then
        filetype=$(file --mime-type -b $ICON_FILE_NAME)
        if [ "$filetype" != "image/png" ]; then 
          ftype=$(echo $filetype | cut -d'/' -f2)
          if [ $ftype == "html" ] || [ $ftype == "plain" ] || [ $ftype == "json" ]; then 
            jq -r '.' <<<"$jsonline" >> tokens_patched.json
            rm $ICON_FILE_NAME
            continue
          else 
            if [[ $ftype == *"svg"* ]]; then
              ftype="svg"
            fi
            rlpath="./icons/$ICON_HASH.$ftype"
            jq --arg rlpath "$rlpath" -r '. + {icon:{filetype:"path",path:"\($rlpath)"}}' <<<"$jsonline" >> tokens_patched.json
            mv $ICON_FILE_NAME $rlpath
          fi
        else
          jq -r '.' <<<"$jsonline" >> tokens_patched.json
        fi
      fi
done

