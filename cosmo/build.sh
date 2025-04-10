#!/usr/bin/env bash

echo "Generating supergraph for producers.graphql and media.graphql ..."
npx wgc router compose -i supergraph-single.yml -o output/supergraph-single.graphql

echo "Generating supergraph for producers.graphql & media-both.graphql ..."
npx wgc router compose -i supergraph-both.yml -o output/supergraph-both.graphql
