foo_files = provider(fields = ["transitive_sources"])

def get_transitive_srcs(srcs, deps):
    return depset(
        src,
        transitive = [dep[foo_files] for dep in deps]
    )

def _foo_library_impl(ctx):
    trans_srcs = get_transitive_srcs(ctx.files.srcs, ctx.attr.deps)
    return [foo_files(transitive_sources = trans_srcs)]

foo_library = rule(
    implementation = _foo_library_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "deps": attr.label_list(),
    }
)

def _foo_binary_impl(ctx):
    out = ctx.outputs.out
    foocc = ctx.executable._foocc
    trans_srcs = get_transitive_srcs(ctx.files.srcs, ctx.attr.deps)
    src_list = trans_srcs.to_list()
    ctx.actions.run(
        ouputs = [out],
        inputs = src_list + [foocc],
        executable = foocc,
        arguments = [out.path] + [src.path for src in src_list],
    )

foo_binary = rule(
    implementation = _foo_binary_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "deps": attr.label_list(),
        "_foocc": attr.label(
            allow_files = True,
            cfg = "host",
            executable = True,
            default = Label("//depsets:foocc"),
        ),
    },
    outputs = {"out": "%{name}.out"},
)