bern_theta_gen <- function(n) {
    function(theta) {
        function() { rbinom(n, 1, theta) }
    }
};

sq_loss <- function(theta, theta_hat) {
    (theta - theta_hat)^2
}

this_puzzle <- make_parameter_problem(
    bern_theta_gen(3),
    sq_loss,
    grader_minimax((0:500)/500)
);

this_tester <- make_parameter_case(
    function() { runif(1, max=1) },
    bern_theta_gen(10),
    sq_loss
);
