export RUST_LOG=interledger=trace

cargo run --bin ilp-cli -- --node http://127.0.0.1:7770 accounts balance alice --auth hi_alice
cargo run --bin ilp-cli -- --node http://127.0.0.1:7770 accounts balance bob --auth hi_alice
cargo run --bin ilp-cli -- --node http://127.0.0.1:8770 accounts balance alice --auth hi_bob
cargo run --bin ilp-cli -- --node http://127.0.0.1:8770 accounts balance charlie --auth hi_bob
cargo run --bin ilp-cli -- --node http://127.0.0.1:9770 accounts balance bob --auth hi_charlie
cargo run --bin ilp-cli -- --node http://127.0.0.1:9770 accounts balance charlie --auth hi_charlie
