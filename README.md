# Supergraph @interfaceObject issue?

## Problem

If a type attempts to implement two interfaces that have `@interfaceType` defined in the same subgraph, then supergraph
generation fails.

## Example

- We have a subgraph called [producers](graphs/producers.graphql) which provides `Producer` `Publisher` types. I also
  define 2 `@interfaceObject` types, `Music` and `Media`.

- We have another subgraph called media that has two different versions

  - In the [first example](graphs/media.graphql) we define a type `Album` that implements the `Music` interface. We also
    define the type `Book` that implements the `Media` interface. This example shows that there are no problems using
    both the `Music` and `Media` interface from the producers subgraph.

  - The [second example](graphs/media-both.graphql) updates the type `Album` to implent both the `Music` and `Media`
    interface. This causes failures during the generation of a router config for both the
    [Apollo Router](apollo/README.md) and [Wundergraph Cosmo](cosmo/README.md).

## Real world use case

### Metadata API

In [Infratographer](https://github.com/infratographer) we have a service called
[metadata-api](https://github.com/infratographer/metadata-api). This service allows use to store metadata on any type in
the supergraph as long as it implements `MetadataNode`. This metadata is stored in two forms, annotations and statuses.
We give each annotations and statuses a namespace, and then a status namespace belongs to an instance of interface type
`StatusOwner`.

This problem comes about because we want an `Account` to be a `StatusOwner`, but the account should also be able to have
metadata, so we also want to implement `MetadataNode`. Which results in a schema looking something like

```
type Account implements Node & MetadataNode & StatusOwner @key(fields: "id") {
	id: ID!
}
```

Which based on the examples above fail to generate a supergraph.

### Workaround

Today we get around this some what by also adding the fields from the `MetadataNode` @interfaceObject to the
`StatusOwner` @interfaceObject, but this isn't a perfect solution. Especially when trying to traverse back to an Account
through a MetadataNode field.
