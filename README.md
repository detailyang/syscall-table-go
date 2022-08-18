
<p align="center">
  <b>
    <span style="font-size:larger;">syscall-table-go</span>
   </b>
   <br />
   <b>Generate Linux Kernel Syscall Table Via Github Action</b>
</p>

```go
package main

import (
    st "github.com/detailyang/syscall-table-go"
    "fmt"
)

func main() {
    for k,v := range st.Table {
        fmt.Println(k, v)
    }
}
```
