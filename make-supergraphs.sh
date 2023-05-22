#!/usr/bin/env bash

echo "Generating supergraph for producers-music..."
rover supergraph compose --config supergraph-music.yml --output supergraphs/supergraph-music.graphql

echo "Generating supergraph for producers-media..."
rover supergraph compose --config supergraph-media.yml --output supergraphs/supergraph-media.graphql

echo "Generating supergraph for producers-both & media-single..."
rover supergraph compose --config supergraph-both-media-single.yml --output supergraphs/supergraph-both-media-single.graphql


echo "Generating supergraph for producers-both & media-both..."
rover supergraph compose --config supergraph-both.yml --output supergraphs/supergraph-both.graphql
