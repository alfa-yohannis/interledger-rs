export RUST_LOG=interledger=trace

cargo run --bin ilp-cli -- --node http://127.0.0.1:7770 accounts  incoming-payments alice --auth hi_alice