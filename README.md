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
(func $write_to_stdout (param $str i32) (param $len i32)

(func $blume.strlen (param $0 i32) (result i32)
(func $blume.streq (param $0 i32) (param $1 i32) (result i32) ;; returns 1 if equal
(func $blume.strstr (param $haystack i32) (param $needle i32) (result i32) ;; returns a pointer relative to haystack if needle is found, 0 otherwise
```
