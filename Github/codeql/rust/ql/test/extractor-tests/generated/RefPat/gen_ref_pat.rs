// generated by codegen, do not edit

fn test_ref_pat() -> () {
    // A reference pattern. For example:
    match x {
        &mut Option::Some(y) => y,
        &Option::None => 0,
    };
}