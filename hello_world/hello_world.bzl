def _hello_world_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".cc")
    ctx.actions.expand_template(
        output = out,
        template = ctx.file._template,
        substitutions = {
            "{NAME}": ctx.attr.username,
        }
    )
    return [DefaultInfo(files = depset([out]))]

hello_world = rule(
    implementation = _hello_world_impl,
    attrs = {
        "username": attr.string(mandatory = False, default = "world"),
        "_template": attr.label(
            allow_single_file = True,
            default = "file.cc.tpl",
            doc = "A file template with {NAME} as placeholder",
        )
    },
)