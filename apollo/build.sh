#!/usr/bin/env bash

APOLLO_ELV2_LICENSE=accept

echo "Generating supergraph for producers.graphql and media.graphql ..."
rover supergraph compose --config supergraph-single.yml --output output/supergraph-single.graphql

echo "Generating supergraph for producers.graphql & media-both.graphql ..."
rover supergraph compose --config supergraph-both.yml --output output/supergraph-both.graphql
