// generated by codegen, do not edit

fn test_ident_pat() -> () {
    // A binding pattern. For example:
    match x {
        Option::Some(y) => y,
        Option::None => 0,
    };
    match x {
        y@Option::Some(_) => y,
        Option::None => 0,
    };
}