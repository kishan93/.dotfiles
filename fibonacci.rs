use std::io;

fn fibonacci(n: u32) -> u32 {
    if n <= 0 {
        return 0;
    } else if n == 1 {
        return 0;
    } else if n == 2 {
        return 1;
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

fn main() {
    loop {
        // Get the input from the user
        println!("Enter the value of n (or '0' to exit):");
        let mut input = String::new();
        io::stdin().read_line(&mut input).expect("Failed to read input");
        let n: u32 = match input.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Check if the user wants to exit
        if n == 0 {
            println!("Exiting...");
            break;
        }

        // Call the fibonacci function and display the result
        let result = fibonacci(n);
        println!("The {}th Fibonacci number is: {}", n, result);
    }
}
