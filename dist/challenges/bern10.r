bern_theta_gen <- function(n) {
    function(theta) {
        function() { rbinom(n, 1, theta) }
    }
};

sq_loss <- function(theta, theta_hat) {
    (theta - theta_hat)^2
}

theta_picker <- function() { runif(1, max=1) };

this_puzzle <- make_parameter_problem(
    bern_theta_gen(10),
    sq_loss,
    grader_prior(theta_picker)
);

this_tester <- make_parameter_case(
    theta_picker,
    bern_theta_gen(10),
    sq_loss
);
