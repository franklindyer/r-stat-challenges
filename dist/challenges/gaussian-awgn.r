awgn_theta_gen <- function(err_std) {
    function (theta) {
        function() { theta + rnorm(1, mean=0, sd=err_std) }
    }
};

sq_loss <- function(theta, theta_hat) {
    (theta - theta_hat)^2
};

this_puzzle <- make_parameter_problem(
    awgn_theta_gen(0.5),
    sq_loss,
    grader_prior(function() { rnorm(1, mean=0, sd=1) }, n_trials=2000),
    n_trials=2000
);
