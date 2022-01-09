library(dplyr)

R_dist <- sin(1:1000 * 2 * pi / 1000)
I_dist <- 2 * cos(1:1000 * 2 * pi / 1000)
RB1_I <- 1.5
RB2_I <- .5
BB1_I <- -.5
BB2_I <- -1.5
RB1_O <- .2
RB2_O <- .3
BB1_O <- .6
BB2_O <- .2

dat <- tibble::tibble(
  time = Sys.time() + 1:1000,
  R_RedA = rep(0, 1000),
  I_RedA = rep(1, 1000),
  R_RedB1 = RB1_O * R_dist,
  I_RedB1 = RB1_I + RB1_O * I_dist,
  R_RedB2 = RB2_O * R_dist,
  I_RedB2 = RB2_I + RB2_O * I_dist,
  R_BlueA = rep(0, 1000),
  I_BlueA = rep(-1, 1000),
  R_BlueB1 = BB1_O * R_dist,
  I_BlueB1 = BB1_I + BB1_O * I_dist,
  R_BlueB2 = BB2_O * R_dist,
  I_BlueB2 = BB2_I + BB2_O * I_dist
)

p<- dat %>%
  tidyr::pivot_longer(-time,
                      names_to = c(".value", "SC"),
                      names_pattern = "(.)_(.*)") %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = I,
               y = R,
               color = SC) +
  ggplot2::geom_point() +
  ggplot2::scale_x_reverse() +
  ggplot2::coord_fixed()

p <- p + gganimate::transition_time(time) +
  ggplot2::labs(title = "Time: {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)

p
