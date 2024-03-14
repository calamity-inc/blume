(module
    (import "wasi_snapshot_preview1" "fd_write" (func $wasi_snapshot_preview1.fd_write (param i32 i32 i32 i32) (result i32)))
    (memory (export "memory") 1) ;; needs to be exported for WASI
	(data (i32.const 12) "Hello, world!\n")
    (func $write_to_stdout (param $str i32) (param $len i32)
        (i32.store
            (i32.const 0) ;; iov.iov_base
            (local.get $str)
            )
        (i32.store
            (i32.const 4) ;; iov.iov_len
            (local.get $len)
            )
        (drop
            (call $wasi_snapshot_preview1.fd_write
                (i32.const 1) ;; stdout
                (i32.const 0) ;; iovs
                (i32.const 1) ;; iovs_len
                (i32.const 0) ;; out_nwritten
                )
            )
        )
    (func (export "_start") ;; WASI entrypoint
        (call $write_to_stdout
            (i32.const 12) (i32.const 14)
            )
        )
    )