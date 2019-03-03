#!/bin/bash
INDEXD="/usr/local/bin/witness_node"

# For blockchain download
VERSION=`cat /etc/bitshares/version`

## Supported Environmental Variables
#
#   * $INDEXD_SEED_NODES
#   * $INDEXD_RPC_ENDPOINT
#   * $INDEXD_PLUGINS
#   * $INDEXD_REPLAY
#   * $INDEXD_RESYNC
#   * $INDEXD_P2P_ENDPOINT
#   * $INDEXD_WITNESS_ID
#   * $INDEXD_PRIVATE_KEY
#   * $INDEXD_TRACK_ACCOUNTS
#   * $INDEXD_PARTIAL_OPERATIONS
#   * $INDEXD_MAX_OPS_PER_ACCOUNT
#   * $INDEXD_ES_NODE_URL
#   * $INDEXD_TRUSTED_NODE
#

ARGS=""
# Translate environmental variables
if [[ ! -z "$INDEXD_SEED_NODES" ]]; then
    for NODE in $INDEXD_SEED_NODES ; do
        ARGS+=" --seed-node=$NODE"
    done
fi
if [[ ! -z "$INDEXD_RPC_ENDPOINT" ]]; then
    ARGS+=" --rpc-endpoint=${INDEXD_RPC_ENDPOINT}"
fi

if [[ ! -z "$INDEXD_REPLAY" ]]; then
    ARGS+=" --replay-blockchain"
fi

if [[ ! -z "$INDEXD_RESYNC" ]]; then
    ARGS+=" --resync-blockchain"
fi

if [[ ! -z "$INDEXD_P2P_ENDPOINT" ]]; then
    ARGS+=" --p2p-endpoint=${INDEXD_P2P_ENDPOINT}"
fi

if [[ ! -z "$INDEXD_WITNESS_ID" ]]; then
    ARGS+=" --witness-id=$INDEXD_WITNESS_ID"
fi

if [[ ! -z "$INDEXD_PRIVATE_KEY" ]]; then
    ARGS+=" --private-key=$INDEXD_PRIVATE_KEY"
fi

if [[ ! -z "$INDEXD_TRACK_ACCOUNTS" ]]; then
    for ACCOUNT in $INDEXD_TRACK_ACCOUNTS ; do
        ARGS+=" --track-account=$ACCOUNT"
    done
fi

if [[ ! -z "$INDEXD_PARTIAL_OPERATIONS" ]]; then
    ARGS+=" --partial-operations=${INDEXD_PARTIAL_OPERATIONS}"
fi

if [[ ! -z "$INDEXD_MAX_OPS_PER_ACCOUNT" ]]; then
    ARGS+=" --max-ops-per-account=${INDEXD_MAX_OPS_PER_ACCOUNT}"
fi

if [[ ! -z "$INDEXD_ES_NODE_URL" ]]; then
    ARGS+=" --elasticsearch-node-url=${INDEXD_ES_NODE_URL}"
fi

if [[ ! -z "$INDEXD_TRUSTED_NODE" ]]; then
    ARGS+=" --trusted-node=${INDEXD_TRUSTED_NODE}"
fi

## Link the bitshares config file into home
## This link has been created in Dockerfile, already
ln -f -s /etc/bitshares/config.ini /var/lib/bitshares

# Plugins need to be provided in a space-separated list, which
# makes it necessary to write it like this
<<<<<<< HEAD
if [[ ! -z "$INDEXD_PLUGINS" ]]; then
   $INDEXD --data-dir ${HOME} ${ARGS} ${INDEXD_ARGS} --plugins "${INDEXD_PLUGINS}"
else
   $INDEXD --data-dir ${HOME} ${ARGS} ${INDEXD_ARGS}
=======
if [[ ! -z "$BITSHARESD_PLUGINS" ]]; then
   exec $BITSHARESD --data-dir ${HOME} ${ARGS} ${BITSHARESD_ARGS} --plugins "${BITSHARESD_PLUGINS}"
else
   exec $BITSHARESD --data-dir ${HOME} ${ARGS} ${BITSHARESD_ARGS}
>>>>>>> upstream/master
fi
