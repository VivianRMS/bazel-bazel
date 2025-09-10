foo_files = provider(fields = ["transitive_sources"])

def get_transitive_srcs(srcs, deps):
    return depset(
        src,
        transitive = [dep[foo_files] for dep in deps]
    )

