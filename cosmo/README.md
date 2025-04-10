# Cosmo Results

```
$ ./build.sh
Generating supergraph for producers.graphql and media.graphql ...
Router config successfully written to output/supergraph-single.graphql
Generating supergraph for producers.graphql & media-both.graphql ...
We found composition errors, while composing.
Please check the errors below:
┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ERROR_MESSAGE                                                                                                          │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ The Object "Album" has the following Interface implementation errors:                                                  │
│  The implementation of Interface "Music" by "Album" is invalid because:                                                │
│   The following field is not implemented: "producer"                                                                   │
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```
