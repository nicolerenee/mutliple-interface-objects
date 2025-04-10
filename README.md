# Supergraph @interfaceObject issue?

When generating the supergraph if you have a subgraph that defines two @interfaceObject types and then another subgraph
object attempts to use both of them, things fail.

For the setup we have a subgraph called [producers](graphs/producers.graphql) which provides `Producer` `Publisher` types.
I also define 2 `@interfaceObject` types, `Music` and `Media`.

We then have a subgraph for media. There are two versions of this the [first example](graphs/media.graphql) defines
the `Album` and `Book` types. `Album` implements the `Music` interface and `Book` implements the `Media` interface. This
shows that we are able to use both `@interfaceObject` types in this subgraph without any issues. The [second example](graphs/media-both.graphql)
is setup the same way but `Album` implents both `Music` and `Media`. This causes failures during the generation of
a router config for both the [Apollo Router](apollo/README.md) and [Wundergraph Cosmo](cosmo/README.md).
