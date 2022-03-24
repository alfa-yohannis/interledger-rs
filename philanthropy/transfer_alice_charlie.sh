export RUST_LOG=interledger=debug

cargo run --bin ilp-cli -- \
  --node http://127.0.0.1:7770 pay alice \
  --auth alice_password \
  --amount 10000000000000000 \
  --to http://127.0.0.1:9770/accounts/charlie/spsp

# cargo run --bin ilp-cli -- --node http://127.0.0.1:8770 pay bob --auth bob_password --amount 20000000000000000 --to http://127.0.0.1:7770/accounts/alice/spsp
