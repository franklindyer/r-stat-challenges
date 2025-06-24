bern_switcher_theta_gen <- function(theta) {
    function() { c(rbinom(theta-1, 1, 1/3), rbinom(20-theta+1, 1, 2/3)) }
}

eq_loss <- function(theta, theta_hat) {
    ifelse(theta == theta_hat, 0, 1)
}

theta_picker <- function() { sample(1:20, 1) };

this_puzzle <- make_parameter_problem(
    bern_switcher_theta_gen,
    eq_loss,
    grader_prior(theta_picker)
);

this_tester <- make_parameter_case(
    theta_picker,
    bern_switcher_theta_gen,
    eq_loss
);
