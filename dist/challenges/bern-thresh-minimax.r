bern_theta_gen <- function(n) {
    function(theta) {
        function() { rbinom(n, 1, theta) }
    }
};

thresh_loss <- function(theta, theta_hat) {
    ifelse(abs(theta - theta_hat) > 0.02, 1, 0)
}

this_puzzle <- make_parameter_problem(
    bern_theta_gen(10),
    thresh_loss,
    grader_minimax((0:1000)/1000)
);

this_tester <- make_parameter_case(
    function() { runif(1, max=1) },
    bern_theta_gen(10),
    thresh_loss
);
