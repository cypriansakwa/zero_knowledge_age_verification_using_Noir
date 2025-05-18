// src/main.nr

fn main(age: u32) {
    let min_age: u32 = 18;
    let max_age: u32 = 60;

    assert(age >= min_age);
    assert(age <= max_age);
}
#[test]
fn test_valid_age() {
    main(35); // Replace 35 with your real/test age
}

