pos_vel_theta_gen <- function(std_err, n) {
    function (theta) {
        pos0 <- theta[1];
        vel <- theta[2];
        function() {
            vel*(0:(n-1)) + pos0 + rnorm(n, mean=0, sd=std_err)
        }
    }
};

sq_loss <- function(theta, theta_hat) {
    loss <- norm(theta-theta_hat, type="2");
    loss
};

this_puzzle <- make_parameter_problem(
    pos_vel_theta_gen(0.5, 10),
    sq_loss,
    grader_prior(function() { rnorm(2, mean=0, sd=1) }, n_trials=500),
    n_trials=500
);

this_tester <- make_parameter_case(
    function() { rnorm(2, mean=0, sd=1) },
    pos_vel_theta_gen(0.5, 10),
    sq_loss
)
