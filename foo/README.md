# Bazel query loads BUILD files, but doesn't analyze targets.
```bash
bazel query :all
DEBUG: /Users/kunlin/Desktop/work/bazel/foo.bzl:9:6: bzl file evaluated
DEBUG: /Users/kunlin/Desktop/work/bazel/BUILD.bazel:5:6: BUILD file
//:bin1
//:bin2
```

# To analyze the targets, use the cquery ("configured query") or the build command.
```bash
bazel cquery :all
DEBUG: /Users/kunlin/Desktop/work/bazel/foo.bzl:2:10: analyzing: @@//:bin2
DEBUG: /Users/kunlin/Desktop/work/bazel/foo.bzl:2:10: analyzing: @@//:bin1
INFO: Analyzed 2 targets (0 packages loaded, 2 targets configured).
INFO: Found 2 targets...
//:bin1 (0de042f)
//:bin2 (0de042f)
INFO: Elapsed time: 0.083s, Critical Path: 0.00s
INFO: 0 processes.
INFO: Build completed successfully, 0 total actions
```

# Because now the rule returns the output file (namely the output file is used), build will actually create and write the file.
```bash
bazel build bin1
DEBUG: /Users/kunlin/Desktop/work/bazel/foo.bzl:15:6: bzl file evaluated
DEBUG: /Users/kunlin/Desktop/work/bazel/BUILD.bazel:5:6: BUILD file
DEBUG: /Users/kunlin/Desktop/work/bazel/foo.bzl:2:10: analyzing: @@//:bin1
INFO: Analyzed target //:bin1 (1 packages loaded, 1 target configured).
INFO: Found 1 target...
Target //:bin1 up-to-date:
  bazel-bin/bin1.out
INFO: Elapsed time: 0.053s, Critical Path: 0.00s
INFO: 2 processes: 2 internal.
INFO: Build completed successfully, 2 total actions
```

# Load from other package
```bash
bazel build foo/hello
INFO: Analyzed target //foo:hello (0 packages loaded, 2 targets configured).
INFO: Found 1 target...
Target //foo:hello up-to-date:
  bazel-bin/foo/hello.cc
INFO: Elapsed time: 0.055s, Critical Path: 0.00s
INFO: 2 processes: 2 internal.
INFO: Build completed successfully, 2 total actions
```

```bash
bazel run foo/hello_bin      
DEBUG: /Users/kunlin/Desktop/work/bazel/foo/BUILD.bazel:6:6: BUILD file
INFO: Analyzed target //foo:hello_bin (2 packages loaded, 13 targets configured).
INFO: Found 1 target...
Target //foo:hello_bin up-to-date:
  bazel-bin/foo/hello_bin
INFO: Elapsed time: 0.434s, Critical Path: 0.36s
INFO: 7 processes: 3 action cache hit, 5 internal, 2 darwin-sandbox.
INFO: Build completed successfully, 7 total actions
INFO: Running command line: bazel-bin/foo/hello_bin
Hello Vivian
```