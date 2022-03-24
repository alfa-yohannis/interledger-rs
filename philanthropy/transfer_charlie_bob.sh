export RUST_LOG=interledger=trace

cargo run --bin ilp-cli -- \
  --node http://127.0.0.1:9770 pay charlie \
  --auth charlie_password \
  --amount 100000000 \
  --to http://127.0.0.1:6770/accounts/bob/spsp
