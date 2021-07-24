export RUST_LOG=interledger=trace

# # alice at alice node
# cargo run --bin ilp-cli -- \
#   --node http://127.0.0.1:7770 accounts create alice \
#   --auth hi_alice \
#   --ilp-address example.y.alice \
#   --asset-code ETH \
#   --asset-scale 18 \
#   --ilp-over-http-incoming-token alice_password

# # bob at bob node
# cargo run --bin ilp-cli -- \
#   --node http://127.0.0.1:8770 accounts create bob \
#   --auth hi_bob \
#   --ilp-address example.bob \
#   --asset-code ETH \
#   --asset-scale 18 \
#   --ilp-over-http-incoming-token bob_password

# alice at alice node
cargo run  --bin ilp-cli -- \
  --node http://127.0.0.1:7770 accounts create alice \
  --auth hi_alice \
  --ilp-address example.y.alice \
  --asset-code ETH \
  --asset-scale 18 \
  --settlement-engine-url http://127.0.0.1:3000 \
  --ilp-over-http-incoming-token connector_password \
  --ilp-over-http-outgoing-token alice_password \
  --ilp-over-http-url http://127.0.0.1:8770/accounts/alice/ilp \
  --settle-threshold 1 \
  --settle-to 0 \
  --routing-relation Peer

# alice at connector node
cargo run  --bin ilp-cli -- \
  --node http://127.0.0.1:8770 accounts create alice \
  --auth hi_connector \
  --ilp-address example.connector.alice \
  --asset-code ETH \
  --asset-scale 18 \
  --settlement-engine-url http://127.0.0.1:3001 \
  --ilp-over-http-incoming-token alice_password \
  --ilp-over-http-outgoing-token connector_password \
  --ilp-over-http-url http://127.0.0.1:7770/accounts/alice/ilp \
  --settle-threshold 1 \
  --settle-to 0 \
  --routing-relation Peer

# bob at bob node
cargo run  --bin ilp-cli -- \
  --node http://127.0.0.1:6770 accounts create bob \
  --auth hi_bob \
  --ilp-address example.y.bob \
  --asset-code ETH \
  --asset-scale 18 \
  --settlement-engine-url http://127.0.0.1:3004 \
  --ilp-over-http-incoming-token connector_password \
  --ilp-over-http-outgoing-token bob_password \
  --ilp-over-http-url http://127.0.0.1:8770/accounts/bob/ilp \
  --settle-threshold 1 \
  --settle-to 0 \
  --routing-relation Peer

# bob at connector node
cargo run  --bin ilp-cli -- \
  --node http://127.0.0.1:8770 accounts create bob \
  --auth hi_connector \
  --ilp-address example.connector.bob \
  --asset-code ETH \
  --asset-scale 18 \
  --settlement-engine-url http://127.0.0.1:3001 \
  --ilp-over-http-incoming-token bob_password \
  --ilp-over-http-outgoing-token connector_password \
  --ilp-over-http-url http://127.0.0.1:6770/accounts/bob/ilp \
  --settle-threshold 1 \
  --settle-to 0 \
  --routing-relation Peer

# platform x at connector node
cargo run  --bin ilp-cli -- \
  --node http://127.0.0.1:8770 accounts create platformx \
  --auth hi_connector \
  --ilp-address example.connector.x \
  --asset-code XRP \
  --asset-scale 6 \
  --settlement-engine-url http://127.0.0.1:3002 \
  --ilp-over-http-incoming-token x_password \
  --ilp-over-http-outgoing-token connector_password \
  --ilp-over-http-url http://127.0.0.1:9770/accounts/connector/ilp \
  --settle-threshold 1 \
  --settle-to 0 \
  --routing-relation Peer

# connector at platform x node
cargo run  --bin ilp-cli -- \
  --node http://127.0.0.1:9770 accounts create connector \
  --auth hi_x \
  --ilp-address example.x.connector \
  --asset-code XRP \
  --asset-scale 6 \
  --settlement-engine-url http://127.0.0.1:3003 \
  --ilp-over-http-incoming-token connector_password \
  --ilp-over-http-outgoing-token x_password \
  --ilp-over-http-url http://127.0.0.1:8770/accounts/platformx/ilp \
  --settle-threshold 1 \
  --settle-to 0 \
  --routing-relation Peer

  #charlie at platform x node
cargo run --bin ilp-cli -- \
  --node http://127.0.0.1:9770 accounts create charlie \
  --auth hi_x \
  --ilp-address example.x.charlie \
  --asset-code XRP \
  --asset-scale 6 \
  --ilp-over-http-incoming-token charlie_password