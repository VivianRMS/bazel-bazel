def _foo_binary_impl(ctx):
    print("analyzing target: {}".format(ctx.label))

foo_binary = rule(
    implementation = _foo_binary_impl,
)

print("bzl file evaluation")