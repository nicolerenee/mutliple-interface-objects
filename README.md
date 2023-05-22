# Supergraph @interfaceObject issue?

When generating the supergraph if you have a subgraph that defines two @interfaceObject types and then another subgraph object attempts to use both of them, things fail.

The subgraph can have two different types that use both the @interfaceObject interfaces as can be seen in media-single.graphql. But If one of the types attempts to use both interfaces it fails as can be seen in media-both.graphql.

Output:

```
$ ./make-supergraphs.sh
Generating supergraph for producers-music...
⌛ resolving SDL for subgraphs defined in supergraph-music.yml
🎶 composing supergraph with Federation v2.4.3

📝 Supergraph Schema was printed to supergraph-music.graphql
Generating supergraph for producers-media...
⌛ resolving SDL for subgraphs defined in supergraph-media.yml
🎶 composing supergraph with Federation v2.4.3

📝 Supergraph Schema was printed to supergraph-media.graphql
Generating supergraph for producers-both & media-single...
⌛ resolving SDL for subgraphs defined in supergraph-both-media-single.yml
🎶 composing supergraph with Federation v2.4.3

📝 Supergraph Schema was printed to supergraph-both-media-single.graphql
Generating supergraph for producers-both & media-both...
⌛ resolving SDL for subgraphs defined in supergraph-both.yml
🎶 composing supergraph with Federation v2.4.3
error[E029]: Encountered 2 build errors while trying to build a supergraph.

Caused by:
    UNKNOWN: The following supergraph API query:
    {
      producedMusic {
        ... on Album {
          publisher {
            ...
          }
        }
      }
    }
    cannot be satisfied by the subgraphs because:
    - from subgraph "producers":
      - cannot find implementation type "Album" (supergraph interface "Music" is declared with @interfaceObject in "producers").
    - from subgraph "media":
      - cannot find field "Album.publisher".
    UNKNOWN: The following supergraph API query:
    {
      album(id: "<any id>") {
        publisher {
          ...
        }
      }
    }
    cannot be satisfied by the subgraphs because:
    - from subgraph "media": cannot find field "Album.publisher".
    - from subgraph "producers": cannot find implementation type "Album" (supergraph interface "Music" is declared with @interfaceObject in "producers").

        The subgraph schemas you provided are incompatible with each other. See https://www.apollographql.com/docs/federation/errors/ for more information on resolving build errors.
```
