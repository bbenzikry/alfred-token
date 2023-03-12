# Meant to be sourced
jq() {
  /usr/local/bin/jq "$@"
}

is_addr() {
  echo "$1" | grep -i -q -x '^0[xX].*'
}