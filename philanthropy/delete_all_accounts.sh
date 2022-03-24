export RUST_LOG=interledger=trace

cargo run --bin ilp-cli -- --node http://127.0.0.1:7770 accounts delete alice --auth hi_alice
cargo run --bin ilp-cli -- --node http://127.0.0.1:6770 accounts delete bob --auth hi_bob
cargo run --bin ilp-cli -- --node http://127.0.0.1:8770 accounts delete alice --auth hi_connector
cargo run --bin ilp-cli -- --node http://127.0.0.1:8770 accounts delete bob --auth hi_connector
cargo run --bin ilp-cli -- --node http://127.0.0.1:8770 accounts delete platformx --auth hi_connector
cargo run --bin ilp-cli -- --node http://127.0.0.1:9770 accounts delete connector --auth hi_x
cargo run --bin ilp-cli -- --node http://127.0.0.1:9770 accounts delete charlie --auth hi_x
