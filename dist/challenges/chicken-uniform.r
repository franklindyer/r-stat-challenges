chicken_theta_gen <- function(theta) {
    function() { runif(1, min=0, max=theta) }
};

chicken_loss <- function(theta, theta_hat) {
    ifelse(theta > theta_hat, theta - theta_hat, 0.25);
}

this_puzzle <- make_parameter_problem(
    chicken_theta_gen,
    chicken_loss,
    grader_prior(function() { runif(1, max=1) })
);
