export RUST_LOG=interledger=trace

cargo run --bin ilp-node -- \
  --ilp_address example.y.bob \
  --secret_seed 8852500887504328225458511465394229327394647958135038836332350604 \
  --admin_auth_token hi_bob \
  --redis_url redis://127.0.0.1:6379/8 \
  --http_bind_address 127.0.0.1:6770 \
  --settlement_api_bind_address 127.0.0.1:6771 \
  --exchange_rate.provider CoinCap 
