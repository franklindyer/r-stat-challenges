gaussian_bclass_gen <- function(theta) {
    function() { ifelse(theta, rnorm(1, mean=1, sd=1), rnorm(1, mean=-1, sd=sqrt(2))) } 
};

unit_loss <- function(theta, theta_hat) {
    ifelse(theta == theta_hat, 0, 1)
}

theta_picker <- function() { rbinom(1, 1, 0.5) };

this_puzzle <- make_parameter_problem(
    gaussian_bclass_gen,
    unit_loss,
    grader_prior(theta_picker, n_trials=1000),
    n_trials=1000
);

this_tester <- make_parameter_case(
    theta_picker,
    gaussian_bclass_gen,
    unit_loss
);
