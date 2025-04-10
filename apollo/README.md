# Apollo Router Results

```
Generating supergraph for producers.graphql and media.graphql ...
merging supergraph schema files
supergraph config loaded successfully

Supergraph Schema was printed to /workspaces/mutliple-interface-objects/apollo/output/supergraph-single.graphql
Generating supergraph for producers.graphql & media-both.graphql ...
merging supergraph schema files
supergraph config loaded successfully
error[E029]: Encountered 2 build errors while trying to build a supergraph.

Caused by:
    SATISFIABILITY_ERROR: The following supergraph API query:
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
    SATISFIABILITY_ERROR: The following supergraph API query:
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
