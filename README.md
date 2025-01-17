# Terminal

Elixir Terminal UIs with Reactish API

## Development

```elixir
# socat file:/dev/tty,raw,icanon=0,echo=0,min=0,escape=0x03 tcp-l:8880,reuseaddr
# socat STDIO fails with: Inappropriate ioctl for device
# no resize event is received with this method
# raw required to avoid translating \r to \n
# min=0 required to answer size query immediatelly
# fork useless because term won't answer size query on reconnection
# escape=0x03 required to honor escape sequences
# while true; do socat file:/dev/tty,raw,icanon=0,echo=0,escape=0x03,min=0 tcp-l:8880,reuseaddr; done
# to exit: ctrl-z, then jobs, then kill %1
#
# socat file:/dev/tty,nonblock,raw,icanon=0,echo=0,min=0,escape=0x03 tcp:127.0.0.1:8880
# client socat to test immediate transmission of typed keys on both ends
# escape=0x03 reqired to honor ctrl-c
#
# echo -en "\033[1mThis is bold text.\033[0m" | nc 127.0.0.1 8880
# to test server end honors escapes
{:ok, pid} = Runner.start_link tty: {Socket, ip: "127.0.0.1", port: 8880}, term: Code, app: {Demo, []}
Process.exit pid, :kill
```

 ## Design Guidelines

- Widget event handlers triggered only from keyboard events
- Use react state and widget events instead of getters (on_change instead of get_value)
    - Corollary: Select is not focusable if on_change is nil
- Function components external children must be ignored
- No mixing on logic and markup allowed. State and logic to the top, markup to the bottom.
