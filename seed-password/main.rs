use rand::SeedableRng;
use rand::rngs::StdRng;
use std::env;
use rand::seq::SliceRandom;

fn main() {
    // Get the seed from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        println!("Usage: cargo run <seed> <password_length>");
        return;
    }
    let seed: u64 = match args[1].parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Seed must be a valid integer");
            return;
        }
    };

    // Get the password length from the command line arguments
    let password_length: usize = match args[2].parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Password length must be a valid integer");
            return;
        }
    };

    // Initialize the random number generator with the provided seed
    let mut rng = StdRng::seed_from_u64(seed);

    // Define the characters, numbers, and symbols to choose from
    let characters: &[u8] = b"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    let numbers: &[u8] = b"0123456789";
    let symbols: &[u8] = b"!@#$%^&*()_-+=<>?";

    // Generate a random string of characters, numbers, and symbols
    let password: String = (0..password_length)
        .map(|_| {
            let choices: &[&[u8]] = &[characters, numbers, symbols];
            let charset = choices.choose(&mut rng).unwrap();
            *charset.choose(&mut rng).unwrap()
        })
        .map(|c| c as char)
        .collect();

    // Print the random password
    println!("{}", password);
}

