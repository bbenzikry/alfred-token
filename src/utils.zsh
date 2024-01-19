# Meant to be sourced
is_addr() {
  echo "$1" | grep -i -q -x '^0[xX].*'
}
