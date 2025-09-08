```bash
bazel build hello_world/hello_bin
INFO: Analyzed target //hello_world:hello_bin (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //hello_world:hello_bin up-to-date:
  bazel-bin/hello_world/hello_bin
INFO: Elapsed time: 0.586s, Critical Path: 0.48s
INFO: 4 processes: 2 internal, 2 darwin-sandbox.
INFO: Build completed successfully, 4 total actions
```

```bash
bazel run hello_world/hello_bin
INFO: Analyzed target //hello_world:hello_bin (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //hello_world:hello_bin up-to-date:
  bazel-bin/hello_world/hello_bin
INFO: Elapsed time: 0.054s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
INFO: Running command line: bazel-bin/hello_world/hello_bin
Hello test
```