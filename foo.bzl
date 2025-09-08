def _foo_binary_impl(ctx):
    print("analyzing: {}".format(ctx.label))

# When evaluated (in loading phase), the callback function _foo_binary_impl is not called.
foo_binary = rule(
    implementation = _foo_binary_impl,
)

print("bzl file evaluated")