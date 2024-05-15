#!/bin/bash

cat <<EOS > syscall.go
package syscall

// at https://raw.githubusercontent.com/torvalds/linux/master/arch/x86/entry/syscalls/syscall_64.tbl
var Table map[uint64]string = map[uint64]string{
$(curl https://raw.githubusercontent.com/torvalds/linux/master/arch/x86/entry/syscalls/syscall_64.tbl | grep -v '\#' |  grep -v "^\$"|  awk '{print $1 ":""\""$3"\","}')
}

var SysTable map[string]uint64 = map[string]uint64{
$(curl https://raw.githubusercontent.com/torvalds/linux/master/arch/x86/entry/syscalls/syscall_64.tbl | grep -v '\#' |  grep -v "^\$"|  awk '{print "\""$3"\"" ":"$1","}')
}
EOS
