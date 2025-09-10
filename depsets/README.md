# Depsets

A `depset` is a data structure in Bazel that represents a collection of files or other items with specific properties. Depsets are used to manage and propagate dependencies in a build system, ensuring that all necessary files are included when building targets.

Depsets have several key features:
1. **Immutability**: Once a depset is created, it cannot be modified. This immutability helps maintain consistency and prevents accidental changes to the dependencies.
2. **Order Preservation**: Depsets maintain the order of their elements, which can be important for certain build processes that rely on the order of dependencies.
2.1 ***PreOrder***
2.2 ***PostOrder***
2.3 ***TopologicalOrder***
3. **Efficient Merging**: Depsets can be efficiently merged together, allowing for the combination of multiple sets of dependencies w`i`thout duplicating elements.

