# Blume
A preprocessor for WAT (WebAssembly text format).

## Example Code
```wat
(module
    (func (export "_start") ;; WASI entrypoint
        (call $write_to_stdout
            (str.ptrandlen "Hello, world!\n")
            )
        )
    )
```

## Documentation

### Mnemonics
- `str.ptr`: `(str) -> (i32)`
- `str.len`: `(str) -> (i32)`
- `str.ptrandlen`: `(str) -> (i32, i32)`

### Functions
```wat
(func $write_to_stdout (param $str i32) (param $len i32) (result i32))
```
