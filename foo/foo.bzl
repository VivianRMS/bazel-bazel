def _foo_binary_impl(ctx):
    print("analyzing: {}".format(ctx.label))
    out = ctx.actions.declare_file(ctx.label.name + ".out")
    ctx.actions.write(
        output = out,
        content = "Hello {}! This is {}.".format(ctx.attr.username, ctx.label.name)
    )
    return [DefaultInfo(files = depset([out]))]

# When evaluated (in loading phase), the callback function _foo_binary_impl is not called.
foo_binary = rule(
    implementation = _foo_binary_impl,
    attrs = {
        "username": attr.string(mandatory = False, default = "world"),
    }
)

print("bzl file evaluated")