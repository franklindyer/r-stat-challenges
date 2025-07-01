unif_theta_gen <- function(theta) {
    function() { runif(1, min=0, max=theta) }
};

sq_loss <- function(theta, theta_hat) {
    (theta - theta_hat)^2
}

this_puzzle <- make_parameter_problem(
    unif_theta_gen,
    sq_loss,
    grader_minimax((0:1000)/1000),
    n_trials=2000
);

this_tester <- make_parameter_case(
    function() { runif(1, max=1) },
    unif_theta_gen,
    sq_loss
);
